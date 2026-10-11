// ЛР 1 — шесть независимых виджетов.
//
// Как сдавать: скопируйте этот файл целиком себе в main.dart, допишите
// шесть функций ниже вместо TODO, запустите — все шесть элементов должны
// появиться на экране. Пришлите готовый файл на проверку.
//
// Основной виджет трогать не нужно. Редактируйте там, где написано TODO.

import 'package:flutter/material.dart';

void main() {
  runApp(const Lab1App());
}

class Lab1App extends StatelessWidget {
  const Lab1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ЛР 1')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task 1:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                task1(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'Task 2:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                task2(),

                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'Task 3:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                task3(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'Task 4:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                task4(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'Task 5:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                task5(),
                const SizedBox(height: 4),
                Divider(),
                const SizedBox(height: 4),
                Text(
                  'Task 6:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                task6(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 1. Заголовок — Text, крупный жирный текст чёрного цвета, обрезается в одну строку, если не помещается.
Widget task1() {
  // TODO: замените Placeholder на Text()
  return Text(
    'Домашняя работа №1 по теме: Виджеты',
    maxLines: 1,
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

// 2. Подпись — небольшой, нежирный курсивный текст белого цвета, обрезается в две строки.
// Также реализуйте подложку из тёмно-серого контейнера с закруглениями, чтобы текст было видно
Widget task2() {
  // TODO: замените Placeholder на ...
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(right: 10, left: 10),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 61, 61, 61),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Text(
      'Виджеты - это своего рода кирпичики, из которых складывается наше приложение. Виджеты представляют собой классы в программистском понимании, так что с ними можно работать поотдельности.',
      maxLines: 2,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontStyle: FontStyle.italic,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

// 3. Иконка — любая Icon на ваш вкус,
// с применением цвета и размером.
Widget task3() {
  // TODO: замените Placeholder на...
  return Icon(Icons.edit, color: Colors.blue, size: 40);
}

// 4. Кнопка с иконкой избранного — большая иконка сердца красного цвета без фона.
// При нажатии пишет в консоль "Вы добавили в избранное"
Widget task4() {
  // TODO: замените Placeholder на ...
  return IconButton(
    onPressed: () {
      print('Вы добавили в избранное');
    },
    icon: Icon(Icons.favorite, color: Colors.red, size: 50),
  );
}

// 5. Кнопка «Подробнее» — кнопка с текстом и обводкой, при нажатии пишет в консоль "Узнать детали"
Widget task5() {
  // TODO: замените Placeholder на ...
  return Container(
    height: 40,
    width: 200,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 76, 191, 227),
      border: Border.all(
        color: const Color.fromARGB(255, 44, 14, 197),
        width: 4,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: ElevatedButton(
      onPressed: () {
        print('Узнать детали');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(0, 237, 234, 234),
      ),
      child: Text(
        'Подробнее',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

// 6. Изображение в стиле Polaroid—  выберите любое из каталога по ссылке
// https://picsum.photos/ (необходим vpn), либо используйте https://docs.flutter.dev/assets/images/dash/dash-fainting.gif
// Добавьте чёрную обводку, а внутри белую рамку в стиле фотографии Polaroid (https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAeKRHzUEOMCX836O6p8R5-XBkrSlf8C4go4C7f1q8ClnmlFaV9emSrUFL&s=10)
// Для реализации используйте Container
Widget task6() {
  // TODO: замените Placeholder на Container()
  return Container(
    height: 10000,
    width: 300,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1),
      color: const Color.fromARGB(255, 182, 175, 175),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 60),
      child: Container(
        color: Colors.white,
        child: Image.network(
          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
        ),
      ),
    ),
  );
}
