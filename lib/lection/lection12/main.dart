// import 'dart:convert';

// const booksJson = '''
// [
//   {"title": "Мастер и Маргарита", "year": 1967, "rating": 5 },
//   {"title": "Война и мир", "year": 1869, "rating": 4 },
//   {"title": "Дюна", "year": 1965, "rating": 4.5 }
// ]
// ''';

// class Book {
//   final String title;
//   final int year;

//   Book({required this.title, required this.year});

//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(title: json["title"], year: json["year"]);
//   }
// }

// void main() {
//   final decoded = jsonDecode(booksJson) as List;
//   final books = decoded.map((item) => Book.fromJson(item)).toList();
//   for (Book book in books) print(book.title, book.year);
// }

// import 'dart:convert';
// const booksJson = '''
// [
//   {"title": "Мастер и Маргарита", "year": 1967, "rating": 4.8},
//   {"title": "Война и мир", "year": 1869, "rating": 4.9},
//   {"title": "Дюна", "year": 1965, "rating": 4.7}
// ]
// ''';
// class Book {
//   final String title;
//   final int year;
//   final double rating;
//   Book({required this.title, required this.year, required this.rating});
//   factory Book.fromJson(Map<String, dynamic> json) {
//     return Book(
//       title: json['title'],
//       year: json['year'],
//       rating: (json['rating'] as num).toDouble(),
//     );
//   }
// }
// void main() {
//   final decoded = jsonDecode(booksJson) as List;
//   final books = decoded.map((item) => Book.fromJson(item)).toList();
//   for (var book in books) {
//     print('${book.title} — ${book.year} — рейтинг: ${book.rating}');
//   }
// }

// import 'dart:convert';

// const bookJson = '''
// {
// "title": "Мастер и Маргарита",
// "year": 1967,
// "author": {"name": "Булгаков", "country": "СССР"},
// "tags": ["роман", "классика", "мистика", "хоррор"]
// }
// ''';

// void main() {
//   final book = jsonDecode(bookJson);
//   print(book['title']);
//   print(book['year']);
//   print(book['author']['name']);
//   print(book['tags'][1]);
//   print(book['tags'].length);
// }

import 'dart:convert';

const booksJson = '''
[
  {"title": "Мастер и Маргарита", "year": 1967, "rating": 4.8},
  {"title": "Война и мир", "year": 1869, "rating": 4.9},
  {"title": "Дюна", "year": 1965, "rating": 4.7}
]
''';

class Book {
  final String title;
  final int year;
  final double rating;
  Book({required this.title, required this.year, required this.rating});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      year: json['year'],
      rating: json['rating'],
    );
  }
}

void main() {
  final decoded = jsonDecode(booksJson) as List;
  final books = decoded.map((item) => Book.fromJson(item)).toList();
  for (var book in books) {
    print('Книга: ${book.title}, год: ${book.year}, рейтинг: ${book.rating}');
    print(books);
  }
}
