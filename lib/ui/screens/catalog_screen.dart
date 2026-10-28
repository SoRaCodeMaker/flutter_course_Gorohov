import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/domain/entities/catalog_anime.dart';
import 'package:flutter_course/ui/widgets/catalog_widget.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://6ad561db48476c0785d97526.mockapi.io';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool isLoading = false;
  bool isSending = false;
  String? error;

  List<Anime> animeList = [];

  // GET-запрос
  Future<void> load() async {
    print('load() вызван');
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      final response = await http.get(Uri.parse('$baseUrl/animes'));
      print('[Catalog] status: ${response.statusCode}');
      if (response.statusCode != 200) {
        throw Exception('Статус ${response.statusCode}');
      }

      final decoded = jsonDecode(response.body) as List;
      // for (final el in decoded) {
      //   final anime = Anime.fromJson(el);
      //   // print(anime.name);
      //   animeList.add(anime);
      // }

      setState(
        () => animeList = decoded.map((e) => Anime.fromJson(e)).toList(),
      );
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  // POST-запрос
  Future<Anime?> createAnime(Anime anime) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/animes'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(anime.toJson()),
      );
      print('POST status: ${response.statusCode}');
      print('POST body: ${response.body}');

      if (response.statusCode != 201) return null;
      return Anime.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } catch (e) {
      print('POST error: $e'); // И ЭТУ СТРОКУ
      return null;
    }
  }

  final Set<String> likedIds = {};

  bool onlyFavorites = false;

  // Кнопка лайка, добавка в множество для подсчёта
  void _toggleLike(String id) {
    setState(() {
      if (likedIds.contains(id)) {
        likedIds.remove(id);
      } else {
        likedIds.add(id);
      }
    });
  }

  // Кнопка переключения избранного
  void _toggleFilter() {
    setState(() {
      onlyFavorites = !onlyFavorites;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    final total = animeList.length;
    final count = likedIds.length;

    // сверка нахождения в множестве и добавление из iterable в list
    final visibleAnimes = onlyFavorites
        ? animeList.where((a) => likedIds.contains(a.id)).toList()
        : animeList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            if (isLoading)
              const Padding(
                padding: EdgeInsets.all(40),
                child: CircularProgressIndicator(),
              )
            else if (error != null)
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Text(
                      'Ошибка: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: load,
                      child: const Text('Обновить'),
                    ),
                  ],
                ),
              ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'МОЙ ТОП АНИМЕ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text('В каталоге: $total. В избранном: $count'),
                  const SizedBox(height: 8),
                  _FilterButton(
                    isActive: onlyFavorites,
                    onPressed: _toggleFilter,
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Введите название аниме',
                labelText: 'Название',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Введите число серий, либо оставьте пустым',
                labelText: 'Количество серий',
              ),
              controller: episodeController,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Введите жанры через пробел, либо оставьте пустым',
                labelText: 'Жанры',
              ),
              controller: collectionController,
            ),
            ElevatedButton(
              onPressed: isSending
                  ? null // Если уже отправляем — кнопка неактивна
                  : () async {
                      final title = titleController.text.trim();
                      if (title.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Введите название!')),
                        );
                        return;
                      }

                      setState(() => isSending = true); // Блокируем кнопку

                      final anime = await createAnime(
                        Anime(
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
                        ),
                      );
                      if (!mounted) return;
                      setState(() => isSending = false);

                      if (anime == null) {
                        // Если ошибка — поля НЕ очищаем, чтобы можно было исправить
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ошибка сервера. Проверьте консоль!'),
                          ),
                        );
                      } else {
                        // Если успех — очищаем и добавляем
                        titleController.clear();
                        episodeController.clear();
                        collectionController.clear();

                        setState(() => animeList.insert(0, anime));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Создан пост ${anime.id}')),
                        );
                      }
                    },
              child: isSending
                  ? SizedBox(
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
                  onLikeTap: () => _toggleLike(anime.id),
                ),
          ],
        ),
      ),
    );
  }
}

// Описание кнопки "Только избранное"
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
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(0, 34),
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
