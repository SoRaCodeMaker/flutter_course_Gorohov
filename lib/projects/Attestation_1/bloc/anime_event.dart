import 'package:flutter_course/projects/Attestation_1/domain/entities/catalog_anime.dart';

sealed class AnimeEvent {}

class AnimeLoadRequested extends AnimeEvent {}

class AnimeAddRequested extends AnimeEvent {
  final Anime anime;
  AnimeAddRequested(this.anime);
}

class AnimeLikeToggled extends AnimeEvent {
  final String animeId;
  AnimeLikeToggled(this.animeId);
}

class AnimeRatingSet extends AnimeEvent {
  final String animeId;
  final int rating;
  AnimeRatingSet(this.animeId, this.rating);
}

class AnimeDeleteRequested extends AnimeEvent {
  final String animeId;
  AnimeDeleteRequested(this.animeId);
}

class AnimeUpdateRequested extends AnimeEvent {
  final Anime anime;
  AnimeUpdateRequested(this.anime);
}
