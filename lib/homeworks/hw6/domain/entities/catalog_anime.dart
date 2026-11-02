import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Anime.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return Anime(
      id: doc.id,
      title: data['title'] as String? ?? 'Без названия',
      episode: data['episode'] as String? ?? 'Неизвестно',
      picture: data['picture'] as String? ?? 'assets/images/placeholder.jpg',
      collection: List<String>.from(data['collection'] as List? ?? const []),
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
