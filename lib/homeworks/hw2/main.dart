import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'МОЙ ТОП АНИМЕ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text('Список из 10 аниме'),
                  ],
                ),
              ),
              Padding(
                //1
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Image.asset(
                                'assets/images/Vinland_Saga.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1. Сага о Винланде',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 50',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Боевик'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Драма'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Историческое'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //2
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/ORB.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2. О движении Земли',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 24',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Драма'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Историческое'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //3
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/DrStone.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '3. Доктор Стоун',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 94, фильмов: 1',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Комедия'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Научпок'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Приключения'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //4
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/OnePiece.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '4. Ван Пис',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 1180, фильмов: 14',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Приключения'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Фэнтези'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Экшен'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //5
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/MadeInAbyss.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5. Созданный в Бездне',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 25, фильмов: 1',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Драма'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Приключения'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Тайна'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Жестокость'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //6
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/Zom100.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '6. Зомби-апокалипсис и список из 100 дел, что я выполню перед смертью',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 12',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Боевик'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Выживание'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Комедия'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Триллер'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //7
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/ReZero.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '7. Re:ZERO – Жизнь с нуля в альтернативном мире',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 85, фильмов: 2',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Драма'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Исэкай'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Психологическое'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Путешествие во времени'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Триллер'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //8
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/StainsGate.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '8. Врата Штейна',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 50, фильмов: 1',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Драма'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Психологическое'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Путешествие во времени'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Триллер'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //7
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/Monster.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '9. Монстр',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 74',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Драма'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Детектив'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Психологическое'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Тайна'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Триллер'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                //10
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    //1
                    padding: EdgeInsets.all(15),
                    child: Row(
                      spacing: 10,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            SizedBox(
                              width: 130,
                              height: 170,
                              child: Expanded(
                                child: Image.asset(
                                  'assets/images/Haikyuu.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 7,
                              top: 7,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10. Волейбол',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Серий: 24',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    156,
                                    154,
                                    154,
                                  ),
                                ),
                              ),
                              Wrap(
                                runSpacing: 4,
                                spacing: 5,
                                children: [
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Спорт'),
                                  ),
                                  Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        82,
                                        238,
                                        162,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                          255,
                                          8,
                                          157,
                                          73,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Text('Школа'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 222, 220, 220),
      ),
    );
  }
}
