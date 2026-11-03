import 'package:flutter_course/projects/Attestation_1/domain/entities/catalog_anime.dart';

sealed class AnimeState {}

class AnimeLoadInProgress extends AnimeState {}

class AnimeLoadSuccess extends AnimeState {
  final List<Anime> animes;
  final Set<String> likedIds;
  final Map<String, int> ratings;

  AnimeLoadSuccess(this.animes, this.likedIds, this.ratings);
}

class AnimeLoadFailure extends AnimeState {
  final String message;
  AnimeLoadFailure(this.message);
}
