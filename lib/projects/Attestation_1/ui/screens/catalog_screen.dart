import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_event.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_state.dart';
import 'package:flutter_course/projects/Attestation_1/domain/entities/catalog_anime.dart';
import 'package:flutter_course/projects/Attestation_1/ui/screens/anime_details_screen.dart';
import 'package:flutter_course/projects/Attestation_1/ui/screens/add_anime_screen.dart';
import 'package:flutter_course/projects/Attestation_1/ui/widgets/catalog_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool onlyFavorites = false;

  void _openAddScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (newContext) => BlocProvider.value(
          value: context.read<AnimeBloc>(),
          child: const AddAnimeScreen(),
        ),
      ),
    );
  }

  void _openEditScreen(Anime anime) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (newContext) => BlocProvider.value(
          value: context.read<AnimeBloc>(), //
          child: AddAnimeScreen(anime: anime),
        ),
      ),
    );
  }

  void _openDetailsScreen(Anime anime) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (newContext) => BlocProvider.value(
          value: context.read<AnimeBloc>(),
          child: AnimeDetailsScreen(anime: anime),
        ),
      ),
    );
  }

  void _confirmDelete(String animeId, String title) {
    final animeBloc = context.read<AnimeBloc>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Удалить аниме?'),
        content: Text('Вы уверены, что хотите удалить "$title"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              animeBloc.add(AnimeDeleteRequested(animeId));
              Navigator.pop(dialogContext);
            },
            child: const Text('Удалить', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('КАТАЛОГ АНИМЕ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: _signOut,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddScreen,
        icon: const Icon(Icons.add),
        label: const Text('Добавить'),
      ),
      body: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          if (state is AnimeLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AnimeLoadFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<AnimeBloc>().add(AnimeLoadRequested()),
                      child: const Text('Обновить'),
                    ),
                  ],
                ),
              ),
            );
          }

          final stateSuccess = state as AnimeLoadSuccess;
          final animeList = stateSuccess.animes;
          final likedIds = stateSuccess.likedIds;

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
                        'МОЙ СПИСОК АНИМЕ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text('В каталоге: $total. В избранном: $count'),
                      const SizedBox(height: 8),
                      _FilterButton(
                        isActive: onlyFavorites,
                        onPressed: () {
                          setState(() {
                            onlyFavorites = !onlyFavorites;
                          });
                        },
                      ),
                    ],
                  ),
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
                    GestureDetector(
                      onTap: () => _openDetailsScreen(anime),
                      child: CatalogWidget(
                        anime: anime,
                        isLiked: likedIds.contains(anime.id),
                        onLikeTap: () => context.read<AnimeBloc>().add(
                          AnimeLikeToggled(anime.id),
                        ),
                        onEditTap: () => _openEditScreen(anime),
                        onDeleteTap: () =>
                            _confirmDelete(anime.id, anime.title),
                      ),
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
