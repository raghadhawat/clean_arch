part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestbooksInitial extends NewestBooksState {}

final class NewestbooksLoading extends NewestBooksState {}

final class NewestbooksFailure extends NewestBooksState {
  final String errMessage;

  const NewestbooksFailure({required this.errMessage});
}

final class NewestbookSuccess extends NewestBooksState {
  final List<BookEntity> books;

  const NewestbookSuccess({required this.books});
}
