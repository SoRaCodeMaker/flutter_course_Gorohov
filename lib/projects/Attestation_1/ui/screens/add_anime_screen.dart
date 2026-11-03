import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_bloc.dart';
import 'package:flutter_course/projects/Attestation_1/bloc/anime_event.dart';
import 'package:flutter_course/projects/Attestation_1/domain/entities/catalog_anime.dart';

class AddAnimeScreen extends StatefulWidget {
  final Anime? anime;

  const AddAnimeScreen({super.key, this.anime});

  @override
  State<AddAnimeScreen> createState() => _AddAnimeScreenState();
}

class _AddAnimeScreenState extends State<AddAnimeScreen> {
  final titleController = TextEditingController();
  final episodeController = TextEditingController();
  final collectionController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isSending = false;

  bool get isEditing => widget.anime != null;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      titleController.text = widget.anime!.title;

      final ep = widget.anime!.episode;
      if (ep.startsWith('Серий: ')) {
        episodeController.text = ep.replaceFirst('Серий: ', '');
      } else if (ep != 'Неизвестно') {
        episodeController.text = ep;
      }

      collectionController.text = widget.anime!.collection.join(' ');
      descriptionController.text = widget.anime!.description;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    episodeController.dispose();
    collectionController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Введите название!')));
      return;
    }

    setState(() => isSending = true);
    try {
      final anime = Anime(
        id: isEditing ? widget.anime!.id : '',
        title: title,
        episode: episodeController.text.trim().isEmpty
            ? 'Неизвестно'
            : 'Серий: ${episodeController.text.trim()}',
        picture: isEditing
            ? widget.anime!.picture
            : 'assets/images/placeholder.jpg',
        collection: collectionController.text
            .split(' ')
            .where((e) => e.isNotEmpty)
            .toList(),
        description: descriptionController.text.trim(),
        rating: isEditing ? widget.anime!.rating : 0,
        createdAt: isEditing ? widget.anime!.createdAt : DateTime.now(),
      );

      if (isEditing) {
        context.read<AnimeBloc>().add(AnimeUpdateRequested(anime));
      } else {
        context.read<AnimeBloc>().add(AnimeAddRequested(anime));
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Аниме обновлено' : 'Аниме добавлено'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Ошибка: $e')));
      }
    } finally {
      if (mounted) setState(() => isSending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Редактировать аниме' : 'Новое аниме'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Название (обязательно)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: episodeController,
              decoration: const InputDecoration(
                labelText: 'Количество серий',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: collectionController,
              decoration: const InputDecoration(
                labelText: 'Жанры (через пробел)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Описание',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: isSending ? null : _save,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: isSending
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      isEditing ? 'Сохранить изменения' : 'Добавить',
                      style: const TextStyle(fontSize: 16),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
