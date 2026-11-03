import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_event.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_state.dart';
import 'package:flutter_course/projects/Attestation_1/domain/entities/catalog_anime.dart';
import 'package:flutter_course/projects/Attestation_1/ui/screens/add_anime_screen.dart';

class AnimeDetailsScreen extends StatelessWidget {
  final Anime anime;

  const AnimeDetailsScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newContext) => BlocProvider.value(
                    value: context.read<AnimeBloc>(),
                    child: AddAnimeScreen(anime: anime),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text('Удалить аниме?'),
                  content: Text(
                    'Вы уверены, что хотите удалить "${anime.title}"?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      child: const Text('Отмена'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AnimeBloc>().add(
                          AnimeDeleteRequested(anime.id),
                        );
                        Navigator.pop(dialogContext);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Удалить',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          bool isLiked = false;
          int currentRating = 0;

          if (state is AnimeLoadSuccess) {
            isLiked = state.likedIds.contains(anime.id);
            currentRating = state.ratings[anime.id] ?? 0;
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: anime.picture == 'none' || anime.picture.isEmpty
                      ? Image.asset(
                          'assets/images/placeholder.jpg',
                          fit: BoxFit.cover,
                        )
                      : Image.asset(anime.picture, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              anime.title,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 32,
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              context.read<AnimeBloc>().add(
                                AnimeLikeToggled(anime.id),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        anime.episode,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: anime.collection.map((genre) {
                          return Chip(
                            label: Text(genre),
                            backgroundColor: const Color.fromARGB(
                              255,
                              217,
                              242,
                              230,
                            ),
                            side: BorderSide.none,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Ваша оценка:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(10, (index) {
                          final starIndex = index + 1;
                          return IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              starIndex <= currentRating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 32,
                            ),
                            onPressed: () {
                              context.read<AnimeBloc>().add(
                                AnimeRatingSet(anime.id, starIndex),
                              );
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Описание:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        anime.description.isEmpty
                            ? 'Описание пока отсутствует.'
                            : anime.description,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ],
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
