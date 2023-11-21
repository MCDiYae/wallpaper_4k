part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchResults extends SearchState {
  final List<Wallpaper> results;

  SearchResults(this.results);
}

final class SearchLoading extends SearchState {}

final class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
