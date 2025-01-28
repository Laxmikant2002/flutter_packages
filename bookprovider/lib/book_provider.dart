import 'package:flutter/material.dart';
import 'models/book.dart';

class BookProvider with ChangeNotifier {
  final List<Book> _selectedBooks = [];

  List<Book> get selectedBooks => _selectedBooks;

  void selectBook(Book book) {
    if (_selectedBooks.length < 6) {
      _selectedBooks.add(book);
      notifyListeners();
    }
  }

  void removeBook(Book book) {
    _selectedBooks.remove(book);
    notifyListeners();
  }

  void reorderBooks(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final Book book = _selectedBooks.removeAt(oldIndex);
    _selectedBooks.insert(newIndex, book);
    notifyListeners();
  }
}
