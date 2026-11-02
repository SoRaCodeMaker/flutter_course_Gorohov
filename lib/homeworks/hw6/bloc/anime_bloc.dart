import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/homeworks/hw6/bloc/anime_event.dart';
import 'package:flutter_course/homeworks/hw6/bloc/anime_state.dart';
import 'package:flutter_course/homeworks/hw6/domain/entities/catalog_anime.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeLoadInProgress()) {
    on<AnimeLoadRequested>(_onLoadRequested);
    on<AnimeLikeToggled>(_onLikeToggled);
  }

  Future<void> _onLoadRequested(
    AnimeLoadRequested event,
    Emitter<AnimeState> emit,
  ) async {
    emit(AnimeLoadInProgress());
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      emit(AnimeLoadFailure('Пользователь не авторизован'));
      return;
    }

    await emit.forEach(
      _watchAnimesAndFavorites(uid),
      onData: (data) => AnimeLoadSuccess(data.animes, data.likedIds),
      onError: (error, stackTrace) =>
          AnimeLoadFailure('Не удалось загрузить каталог'),
    );
  }

  Stream<({List<Anime> animes, Set<String> likedIds})> _watchAnimesAndFavorites(
    String uid,
  ) async* {
    await for (final animesSnap
        in FirebaseFirestore.instance.collection('animes').snapshots()) {
      final animes = animesSnap.docs
          .map((doc) => Anime.fromFirestore(doc))
          .toList();

      final favSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .get();

      final likedIds = favSnap.docs.map((doc) => doc.id).toSet();
      yield (animes: animes, likedIds: likedIds);
    }
  }

  Future<void> _onLikeToggled(
    AnimeLikeToggled event,
    Emitter<AnimeState> emit,
  ) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final favRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(event.animeId);

    final doc = await favRef.get();

    if (doc.exists) {
      await favRef.delete();
    } else {
      await favRef.set({'liked': true});
    }
    add(AnimeLoadRequested());
  }
}
