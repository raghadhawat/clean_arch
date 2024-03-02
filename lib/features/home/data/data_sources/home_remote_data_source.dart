import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utlis/api_server.dart';
import 'package:bookly_app/core/utlis/functions/save_box.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestdBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServer apiServer;

  HomeRemoteDataSourceImp({required this.apiServer});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServer.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=Programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBoxData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestdBooks() async {
    var data = await apiServer.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
    List<BookEntity> books = getBooksList(data);
    saveBoxData(books, kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
