import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper_ui/core/utils/approute.dart';
import 'package:wallpaper_ui/data/models/wallpaper_model.dart';
import 'package:wallpaper_ui/data/repositories/wallpaper_repository.dart';

class WallpaperList extends StatelessWidget {
  final String category;
  const WallpaperList({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utilisez le WallpaperRepository pour récupérer les fonds d'écran depuis l'API.
    final wallpaperRepository = WallpaperRepository();
    return FutureBuilder<List<Wallpaper>>(
      future: wallpaperRepository.fetchWallpaperByCategory(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        } else if (snapshot.hasData) {
          final wallpapers = snapshot.data;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Deux éléments par ligne.
              childAspectRatio: 0.7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
            ),
            itemCount: wallpapers?.length,
            itemBuilder: (context, index) {
              final wallpaper = wallpapers![index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoute.kWallPage);
                },
                child: Image.network(wallpaper.src.portrait),
              );
            },
          );
        } else {
          return const Text('Aucune donnée disponible.');
        }
      },
    );
  }
}
