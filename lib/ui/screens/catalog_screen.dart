import 'package:flutter/material.dart';
import 'package:flutter_course/domain/entities/catalog_anime.dart';
import 'package:flutter_course/ui/widgets/catalog_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<CatalogAnime> animeList = [
    CatalogAnime(
      name: 'Сага о Винланде',
      episode: 'Серий: 50',
      picture: 'assets/images/Vinland_Saga.jpg',
      collection: ['Боевик', 'Драма', 'Историческое'],
    ),
    CatalogAnime(
      name: 'О движении Земли',
      episode: 'Серий: 24',
      picture: 'assets/images/ORB.jpg',
      collection: ['Драма', 'Историческое'],
    ),
    CatalogAnime(
      name: 'Доктор Стоун',
      episode: 'Серий: 94, фильмов: 1',
      picture: 'assets/images/DrStone.jpg',
      collection: ['Комедия', 'Научпок', 'Приключения'],
    ),
    CatalogAnime(
      name: 'Ван Пис',
      episode: 'Серий: 1180, фильмов: 14',
      picture: 'assets/images/OnePiece.jpg',
      collection: ['Приключения', 'Фэнтези', 'Экшен'],
    ),
    CatalogAnime(
      name: 'Созданный в бездне',
      episode: 'Серий: 25, фильмов: 1',
      picture: 'assets/images/MadeInAbyss.jpg',
      collection: ['Драма', 'Приключения', 'Тайна', 'Жестокость'],
    ),
    CatalogAnime(
      name:
          'Зомби-апокалипсис и список из 100 дел, что я выполню перед смертью',
      episode: 'Серий: 12',
      picture: 'assets/images/Zom100.jpg',
      collection: ['Боевик', 'Выживание', 'Комедия', 'Триллер'],
    ),
    CatalogAnime(
      name: 'Re:ZERO – Жизнь с нуля в альтернативном мире',
      episode: 'Серий: 85, фильмов: 2',
      picture: 'assets/images/ReZero.jpg',
      collection: [
        'Драма',
        'Исекай',
        'Психологическое',
        'Путешествие во времени',
        'Триллер',
      ],
    ),
    CatalogAnime(
      name: 'Врата Штейна',
      episode: 'Серий: 50, фильмов: 1',
      picture: 'assets/images/StainsGate.jpg',
      collection: [
        'Драма',
        'Психологическое',
        'Путешествие во времени',
        'Триллер',
      ],
    ),
    CatalogAnime(
      name: 'Монстр',
      episode: 'Серий: 74',
      picture: 'assets/images/Monster.jpg',
      collection: ['Драма', 'Детектив', 'Психологическое', 'Тайна', 'Триллер'],
    ),
    CatalogAnime(
      name: 'Волейбол',
      episode: 'Серий: 90',
      picture: 'assets/images/Haikyuu.jpg',
      collection: ['Спорт', 'Школа'],
    ),
  ];

  final Set<String> likedIds = {}; // множество для подсчёта лайков

  bool onlyFavorites = false; // false - весь список, true - только избранное

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

  @override
  Widget build(BuildContext context) {
    final total = animeList.length; // количество всего
    final count = likedIds.length; // количество избранного

    // сверка нахождения в множестве и добавление из iterable в list
    final visibleAnimes = onlyFavorites
        ? animeList.where((a) => likedIds.contains(a.name)).toList()
        : animeList;

    return Scaffold(
      body: SingleChildScrollView(
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
                  isLiked: likedIds.contains(anime.name),
                  onLikeTap: () => _toggleLike(anime.name),
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
