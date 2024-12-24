part of 'search_result_books_cubit.dart';

sealed class SearchResultBooksState extends Equatable {
  const SearchResultBooksState();
  @override
  List<Object> get props => [];
}

class SearchResultBooksInitial extends SearchResultBooksState {}

class SearchResultBooksLoading extends SearchResultBooksState {}

class SearchResultBooksFailure extends SearchResultBooksState {
  final String errMessage;
  const SearchResultBooksFailure(this.errMessage);
}

class SearchResultBooksSuccess extends SearchResultBooksState {
  final List<BookModel> books;
  const SearchResultBooksSuccess(this.books);
}