import 'package:cloud_firestore/cloud_firestore.dart';

class Anime {
  final String id;
  final String title;
  final String episode;
  final String picture;
  final List<String> collection;
  final String description;
  final int rating;
  final DateTime? createdAt;

  Anime({
    required this.id,
    required this.title,
    required this.episode,
    required this.picture,
    required this.collection,
    this.description = '',
    this.rating = 0,
    this.createdAt,
  });

  factory Anime.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    final timestamp = data['createdAt'] as Timestamp?;
    return Anime(
      id: doc.id,
      title: data['title'] as String? ?? 'Без названия',
      episode: data['episode'] as String? ?? 'Неизвестно',
      picture: data['picture'] as String? ?? 'assets/images/placeholder.jpg',
      collection: List<String>.from(data['collection'] as List? ?? const []),
      description: data['description'] as String? ?? '',
      rating: (data['rating'] as num?)?.toInt() ?? 0,
      createdAt: timestamp?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    final json = {
      'title': title,
      'episode': episode,
      'picture': picture,
      'collection': collection,
      'description': description,
      'rating': rating,
    };
    if (createdAt != null) {
      json['createdAt'] = Timestamp.fromDate(createdAt!);
    }
    return json;
  }
}
