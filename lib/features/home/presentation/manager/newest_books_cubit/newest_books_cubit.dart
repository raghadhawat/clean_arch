import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestbooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestdBooks() async {
    emit(NewestbooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(
        NewestbooksFailure(errMessage: failure.errMessage),
      );
    }, (books) {
      emit(
        NewestbookSuccess(books: books),
      );
    });
  }
}
