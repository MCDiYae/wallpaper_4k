import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_ui/data/models/wallpaper_model.dart';

import '../../data/repositories/wallpaper_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search(String query) async {
    emit(SearchLoading());

    try {
      final wallpaperRepository = WallpaperRepository();
      final results = await wallpaperRepository.searchWallpapers(query);

      emit(SearchResults(results));
    } catch (e) {
      emit(SearchError('An error occurred while searching.'));
    }
  }
}
