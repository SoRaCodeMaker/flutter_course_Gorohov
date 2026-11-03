import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_course/projects/Attestation_1/domain/entities/catalog_anime.dart';

class AnimeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<({List<Anime> animes, Set<String> likedIds, Map<String, int> ratings})>
  getAnimeStream() async* {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await for (final animesSnap
        in _firestore.collection('animes').snapshots()) {
      final animes = animesSnap.docs
          .map((doc) => Anime.fromFirestore(doc))
          .toList();

      final favSnap = await _firestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .get();
      final likedIds = favSnap.docs.map((doc) => doc.id).toSet();

      final ratingSnap = await _firestore
          .collection('users')
          .doc(uid)
          .collection('ratings')
          .get();
      final ratings = <String, int>{};
      for (var doc in ratingSnap.docs) {
        final val = doc.data()['value'];
        if (val is num) ratings[doc.id] = val.toInt();
      }

      yield (animes: animes, likedIds: likedIds, ratings: ratings);
    }
  }

  Future<void> addAnime(Anime anime) async {
    await _firestore.collection('animes').add(anime.toJson());
  }

  Future<void> updateAnime(Anime anime) async {
    await _firestore.collection('animes').doc(anime.id).update(anime.toJson());
  }

  Future<void> deleteAnime(String id) async {
    await _firestore.collection('animes').doc(id).delete();
  }

  Future<void> toggleLike(String animeId) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final favRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .doc(animeId);

    final doc = await favRef.get();
    if (doc.exists) {
      await favRef.delete();
    } else {
      await favRef.set({'liked': true});
    }
  }

  Future<void> setRating(String animeId, int rating) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('ratings')
        .doc(animeId)
        .set({'value': rating});
  }
}
