import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_event.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_state.dart';
import 'package:flutter_course/projects/Attestation_1/data/anime_repository.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository _repository;

  AnimeBloc(this._repository) : super(AnimeLoadInProgress()) {
    on<AnimeLoadRequested>(_onLoadRequested);
    on<AnimeAddRequested>(_onAddRequested);
    on<AnimeLikeToggled>(_onLikeToggled);
    on<AnimeRatingSet>(_onRatingSet);
    on<AnimeDeleteRequested>(_onDeleteRequested);
    on<AnimeUpdateRequested>(_onUpdateRequested);
  }

  Future<void> _onLoadRequested(
    AnimeLoadRequested event,
    Emitter<AnimeState> emit,
  ) async {
    emit(AnimeLoadInProgress());

    await emit.forEach(
      _repository.getAnimeStream(),
      onData: (data) {
        return AnimeLoadSuccess(data.animes, data.likedIds, data.ratings);
      },
      onError: (error, stackTrace) =>
          AnimeLoadFailure('Не удалось загрузить каталог'),
    );
  }

  Future<void> _onAddRequested(
    AnimeAddRequested event,
    Emitter<AnimeState> emit,
  ) async {
    try {
      await _repository.addAnime(event.anime);
      add(AnimeLoadRequested());
    } catch (e) {
      emit(AnimeLoadFailure('Не удалось добавить аниме'));
    }
  }

  Future<void> _onLikeToggled(
    AnimeLikeToggled event,
    Emitter<AnimeState> emit,
  ) async {
    await _repository.toggleLike(event.animeId);
    add(AnimeLoadRequested());
  }

  Future<void> _onRatingSet(
    AnimeRatingSet event,
    Emitter<AnimeState> emit,
  ) async {
    await _repository.setRating(event.animeId, event.rating);
    add(AnimeLoadRequested());
  }

  Future<void> _onDeleteRequested(
    AnimeDeleteRequested event,
    Emitter<AnimeState> emit,
  ) async {
    try {
      await _repository.deleteAnime(event.animeId);
      add(AnimeLoadRequested());
    } catch (e) {
      emit(AnimeLoadFailure('Не удалось удалить аниме'));
    }
  }

  Future<void> _onUpdateRequested(
    AnimeUpdateRequested event,
    Emitter<AnimeState> emit,
  ) async {
    try {
      await _repository.updateAnime(event.anime);
      add(AnimeLoadRequested());
    } catch (e) {
      emit(AnimeLoadFailure('Не удалось обновить аниме'));
    }
  }
}
