import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/firebase_options.dart';

const String jsonData = '''
[
  {
    "title": "Сага о Винланде",
    "episode": "Серий: 50",
    "picture": "assets/images/Vinland_Saga.jpg",
    "collection": ["Боевик", "Драма", "Историческое"],
    "id": "1"
  },
  {
    "title": "О движении Земли",
    "episode": "Серий: 24",
    "picture": "assets/images/ORB.jpg",
    "collection": ["Драма", "Историческое"],
    "id": "2"
  },
  {
    "title": "Доктор Стоун",
    "episode": "Серий: 94, фильмов: 1",
    "picture": "assets/images/DrStone.jpg",
    "collection": ["Комедия", "Научпок", "Приключения"],
    "id": "3"
  },
  {
    "title": "Ван Пис",
    "episode": "Серий: 1180, фильмов: 14",
    "picture": "assets/images/OnePiece.jpg",
    "collection": ["Приключения", "Фэнтези", "Экшен"],
    "id": "4"
  },
  {
    "title": "Созданный в бездне",
    "episode": "Серий: 25, фильмов: 1",
    "picture": "assets/images/MadeInAbyss.jpg",
    "collection": ["Драма", "Приключения", "Тайна", "Жестокость"],
    "id": "5"
  },
  {
    "title": "Зомби-апокалипсис и список из 100 дел, что я выполню перед смертью",
    "episode": "Серий: 12",
    "picture": "assets/images/Zom100.jpg",
    "collection": ["Боевик", "Выживание", "Комедия", "Триллер"],
    "id": "6"
  },
  {
    "title": "Re:ZERO – Жизнь с нуля в альтернативном мире",
    "episode": "Серий: 85, фильмов: 2",
    "picture": "assets/images/ReZero.jpg",
    "collection": ["Драма", "Исекай", "Психологическое", "Путешествие во времени", "Триллер"],
    "id": "7"
  },
  {
    "title": "Врата Штейна",
    "episode": "Серий: 50, фильмов: 1",
    "picture": "assets/images/StainsGate.jpg",
    "collection": ["Драма", "Психологическое", "Путешествие во времени", "Триллер"],
    "id": "8"
  },
  {
    "title": "Монстр",
    "episode": "Серий: 74",
    "picture": "assets/images/Monster.jpg",
    "collection": ["Драма", "Детектив", "Психологическое", "Тайна", "Триллер"],
    "id": "9"
  },
  {
    "title": "Волейбол",
    "episode": "Серий: 90",
    "picture": "assets/images/Haikyuu.jpg",
    "collection": ["Спорт", "Школа"],
    "id": "10"
  },
  {
    "title": "Токийский гуль",
    "episode": "50",
    "picture": "assets/images/placeholder.jpg",
    "collection": ["Боевик", "Драма", "Фэнтези", "Жестокость"],
    "id": "11"
  },
  {
    "title": "Наруто",
    "episode": "Серий: ",
    "picture": "assets/images/placeholder.jpg",
    "collection": [],
    "id": "12"
  },
  {
    "title": "Дороро",
    "episode": "24",
    "picture": "assets/images/placeholder.jpg",
    "collection": [],
    "id": "13"
  },
  {
    "title": "Фэйт",
    "episode": "Неизвестно",
    "picture": "assets/images/placeholder.jpg",
    "collection": [],
    "id": "14"
  },
  {
    "title": "Коносуба",
    "episode": "Серий: 36",
    "picture": "assets/images/placeholder.jpg",
    "collection": ["Комедия", "Приключение", "Фэнтези", "Иссекай"],
    "id": "15"
  },
  {
    "title": "Вайолет Эвергарден",
    "episode": "Серий: 12",
    "picture": "assets/images/placeholder.jpg",
    "collection": ["драма", "война"],
    "id": "16"
  },
  {
    "title": "Квартет попаданцев",
    "episode": "Серий: 36",
    "picture": "assets/images/placeholder.jpg",
    "collection": ["Комедия", "Исекай", "Школа"],
    "id": "17"
  },
  {
    "title": "Оверлорд",
    "episode": "Серий: 12",
    "picture": "assets/images/placeholder.jpg",
    "collection": ["Боевик", "Фэнтези"],
    "id": "19"
  },
  {
    "title": "Когда плачут цикады",
    "episode": "Серий: 24",
    "picture": "assets/images/placeholder.jpg",
    "collection": ["ужасы", "триллер"],
    "id": "29"
  }
]
''';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print('Начинаем загрузку данных в Firestore...');

  try {
    final List<dynamic> data = jsonDecode(jsonData);
    final collection = FirebaseFirestore.instance.collection('animes');

    final batch = FirebaseFirestore.instance.batch();

    for (var item in data) {
      final docRef = collection.doc();
      item.remove('id');
      batch.set(docRef, item);
    }

    await batch.commit();
    print('✅ Успешно загружено ${data.length} аниме!');
  } catch (e) {
    print('❌ Ошибка при загрузке: $e');
  }
}
