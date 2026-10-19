void main() {
  // String name = 'Захар';
  // int age = 21;
  // double height = 1.80;
  // print('$name, $age лет, рост $height, м');
  // String text = 'flutter developer';
  // print(text.trim().toUpperCase());

  // var food = ['Молоко', 'Хлеб'];
  // food.add('Сыр');
  // print(food);
  // food.remove('Хлеб');
  // print(food);
  // print('В корзине: ${food.length}, шт');

  for (var i = 0; i < 11; i++) {
    if (i % 2 == 0) {
      print('$i, чётное');
    } else {
      print(i);
    }
  }

  int age = 19;
  if (age < 12) {
    print('Ребёнок');
  } else if (age < 18) {
    print('Подросток');
  } else {
    print('Взрослый');
  }
}
