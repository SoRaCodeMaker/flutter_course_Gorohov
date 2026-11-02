import 'package:flutter_course/homeworks/hw6/domain/entities/catalog_anime.dart';

sealed class AnimeState {}

class AnimeLoadInProgress extends AnimeState {}

class AnimeLoadSuccess extends AnimeState {
  final List<Anime> animes;
  final Set<String> likedIds;
  AnimeLoadSuccess(this.animes, this.likedIds);
}

class AnimeLoadFailure extends AnimeState {
  final String message;
  AnimeLoadFailure(this.message);
}
