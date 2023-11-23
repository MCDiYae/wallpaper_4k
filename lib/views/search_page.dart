import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_ui/BLoC/cubit/search_cubit.dart';

import 'package:wallpaper_ui/views/wallpaper_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: "Find your wallpapers",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Déclenchez la recherche en utilisant la valeur saisie
              final searchTerm = _searchController.text;
              context.read<SearchCubit>().search(searchTerm);
            },
            child: const Text('Search'),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              // Construisez votre interface utilisateur en fonction de l'état du Cubit
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchResults) {
                // Utilisez les résultats pour construire votre GridView
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final wallpaper = state.results[index];
                      return GestureDetector(
                        onTap: () {
                          // Ouvrez la page du fond d'écran en plein écran
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WallpaperPage(
                                imageUrl: wallpaper.src.portrait,
                              ),
                            ),
                          );
                        },
                        child: Image.network(wallpaper.src.portrait),
                      );
                    },
                  ),
                );
              } else if (state is SearchError) {
                return Center(
                  child: Text('Error: ${state.errorMessage}'),
                );
              } else {
                // État initial ou autre état non géré
                return Container();
              }
            },
          ),
        ],
      ),
    ));
  }
}
