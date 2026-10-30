sealed class AnimeEvent {}

class AnimeLoadRequested extends AnimeEvent {}

class AnimeLikeToggled extends AnimeEvent {
  final String animeId;
  AnimeLikeToggled(this.animeId);
}
