class Anime {
  final String id;
  final String title;
  final String episode;
  final String picture;
  final List<String> collection;

  Anime({
    required this.id,
    required this.title,
    required this.episode,
    required this.picture,
    required this.collection,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'].toString(),
      title: json['title'] as String? ?? 'Без названия',
      episode: json['episode'] as String? ?? 'Неизвестно',
      picture: json['picture'] as String? ?? 'assets/images/placeholder.jpg',
      collection: List<String>.from(json['collection'] as List? ?? const []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'episode': episode,
      'picture': picture,
      'collection': collection,
    };
  }
}
