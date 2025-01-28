import 'dart:convert';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Data data;

  Welcome({
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Book> books;
  int count;

  Data({
    required this.books,
    required this.count,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
        "count": count,
      };
}

class Book {
  int id;
  String title;
  String author;
  String coverUrl;
  Series? series;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    this.series,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        coverUrl: json["cover_url"],
        series: json["series"] == null ? null : Series.fromJson(json["series"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "cover_url": coverUrl,
        "series": series?.toJson(),
      };
}

class Series {
  int id;
  int index;
  String title;

  Series({
    required this.id,
    required this.index,
    required this.title,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["id"],
        index: json["index"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "index": index,
        "title": title,
      };
}

// Function to fetch books from the API
Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final data = Welcome.fromJson(jsonResponse).data;
    return data.books;
  } else {
    throw Exception('Failed to load books');
  }
}
