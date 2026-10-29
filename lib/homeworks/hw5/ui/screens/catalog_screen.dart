import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/homeworks/hw5/domain/entities/catalog_anime.dart';
import 'package:flutter_course/homeworks/hw5/ui/widgets/catalog_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final itemsStream = FirebaseFirestore.instance
      .collection('animes')
      .snapshots();

  bool isSending = false;
  final Set<String> likedIds = {};
  bool onlyFavorites = false;

  final titleController = TextEditingController();
  final episodeController = TextEditingController();
  final collectionController = TextEditingController();

  @override
  void dispose() {
    episodeController.dispose();
    titleController.dispose();
    collectionController.dispose();
    super.dispose();
  }

  void toggleLike(String id) {
    setState(() {
      if (likedIds.contains(id)) {
        likedIds.remove(id);
      } else {
        likedIds.add(id);
      }
    });
  }

  void toggleFilter() {
    setState(() {
      onlyFavorites = !onlyFavorites;
    });
  }

  Future<void> addAnime() async {
    final title = titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Введите название!')));
      return;
    }

    setState(() => isSending = true);
    try {
      final anime = Anime(
        id: '',
        title: title,
        episode: episodeController.text.trim().isEmpty
            ? 'Неизвестно'
            : 'Серий: ${episodeController.text.trim()}',
        picture: 'assets/images/placeholder.jpg',
        collection: collectionController.text
            .split(' ')
            .where((e) => e.isNotEmpty)
            .toList(),
      );

      await FirebaseFirestore.instance.collection('animes').add(anime.toJson());

      if (!mounted) return;
      titleController.clear();
      episodeController.clear();
      collectionController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Аниме добавлено')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Ошибка добавления: $e')));
    } finally {
      if (mounted) setState(() => isSending = false);
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой топ аниме'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: _signOut,
          ),
        ],
      ),

      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: itemsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  'Ошибка: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final animeList = (snapshot.data?.docs ?? [])
              .map((doc) => Anime.fromFirestore(doc))
              .toList();

          final total = animeList.length;
          final count = likedIds.length;

          final visibleAnimes = onlyFavorites
              ? animeList.where((a) => likedIds.contains(a.id)).toList()
              : animeList;

          return SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'МОЙ ТОП АНИМЕ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text('В каталоге: $total. В избранном: $count'),
                      const SizedBox(height: 8),
                      _FilterButton(
                        isActive: onlyFavorites,
                        onPressed: toggleFilter,
                      ),
                    ],
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Введите название аниме',
                    labelText: 'Название',
                  ),
                  controller: titleController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Введите число серий, либо оставьте пустым',
                    labelText: 'Количество серий',
                  ),
                  controller: episodeController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText:
                        'Введите жанры через пробел, либо оставьте пустым',
                    labelText: 'Жанры',
                  ),
                  controller: collectionController,
                ),
                ElevatedButton(
                  onPressed: isSending ? null : addAnime,
                  child: isSending
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Добавить'),
                ),
                if (visibleAnimes.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'Пока нет избранных аниме',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                else
                  for (final anime in visibleAnimes)
                    CatalogWidget(
                      anime: anime,
                      isLiked: likedIds.contains(anime.id),
                      onLikeTap: () => toggleLike(anime.id),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPressed;

  const _FilterButton({required this.isActive, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    const activeBg = Color.fromARGB(255, 217, 242, 230);
    const activeText = Color.fromARGB(255, 11, 122, 75);
    const inactiveBg = Color.fromARGB(255, 243, 242, 242);
    const inactiveText = Color.fromARGB(255, 136, 136, 136);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? activeBg : inactiveBg,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: const Size(0, 34),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.favorite,
            size: 16,
            color: isActive ? Colors.red : inactiveText,
          ),
          const SizedBox(width: 6),
          Text(
            'Только избранные',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isActive ? activeText : inactiveText,
            ),
          ),
        ],
      ),
    );
  }
}
