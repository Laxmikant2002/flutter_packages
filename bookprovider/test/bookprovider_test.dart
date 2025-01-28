import 'package:flutter_test/flutter_test.dart';
import 'package:bookprovider/models/book.dart';
import 'package:bookprovider/book_provider.dart';

void main() {
  test('selectBook adds a book to the selectedBooks list', () {
    final provider = BookProvider();
    final book =
        Book(id: '1', title: 'Test Book', author: 'author', imageUrl: 'url');

    provider.selectBook(book);

    expect(provider.selectedBooks, contains(book));
  });

  test('removeBook removes a book from the selectedBooks list', () {
    final provider = BookProvider();
    final book =
        Book(id: '1', title: 'Test Book', author: 'author', imageUrl: 'url');

    provider.selectBook(book);
    provider.removeBook(book);

    expect(provider.selectedBooks, isNot(contains(book)));
  });

  test('reorderBooks moves a book in the selectedBooks list', () {
    final provider = BookProvider();
    final book1 =
        Book(id: '1', title: 'Test Book 1', author: 'author', imageUrl: 'url');
    final book2 =
        Book(id: '2', title: 'Test Book 2', author: 'author', imageUrl: 'url');

    provider.selectBook(book1);
    provider.selectBook(book2);
    provider.reorderBooks(0, 1);

    expect(provider.selectedBooks[0], book2);
    expect(provider.selectedBooks[1], book1);
  });
}
