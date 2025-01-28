import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:book_api/book_api.dart';
import 'dart:convert';

void main() {
  test('fetchBooks returns a list of books', () async {
    // Mock the HTTP client
    final client = MockClient((request) async {
      final jsonResponse = {
        "data": {
          "books": [
            {
              "id": 1,
              "title": "Book 1",
              "author": "Author 1",
              "cover_url": "http://example.com/cover1.jpg",
              "series": null
            },
            {
              "id": 2,
              "title": "Book 2",
              "author": "Author 2",
              "cover_url": "http://example.com/cover2.jpg",
              "series": null
            }
          ],
          "count": 2
        }
      };
      return http.Response(json.encode(jsonResponse), 200);
    });

    // Replace the http.get call with the mock client
    Future<List<Book>> fetchBooks(http.Client client) async {
      final response = await client.get(Uri.parse('http://example.com/books'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final data = Welcome.fromJson(jsonResponse).data;
        return data.books;
      } else {
        throw Exception('Failed to load books');
      }
    }

    // Call the fetchBooks function with the mock client
    final books = await fetchBooks(client);

    // Verify the result
    expect(books.length, 2);
    expect(books[0].title, 'Book 1');
    expect(books[1].title, 'Book 2');
  });
}
