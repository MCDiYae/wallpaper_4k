// import 'package:flutter/material.dart';

// class WallpaperList extends StatelessWidget {
//   const WallpaperList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Remplacez cette liste factice par la liste réelle de fonds d'écran que vous obtenez depuis votre API.
//     final List<String> wallpapers = [
//       'https://images.pexels.com/photos/17140100/pexels-photo-17140100/free-photo-of-sandstone-formations-of-canyon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/8427409/pexels-photo-8427409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/17140100/pexels-photo-17140100/free-photo-of-sandstone-formations-of-canyon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/8427409/pexels-photo-8427409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/17140100/pexels-photo-17140100/free-photo-of-sandstone-formations-of-canyon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/8427409/pexels-photo-8427409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/17528251/pexels-photo-17528251/free-photo-of-beauty-swimming-jellyfish.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//       'https://images.pexels.com/photos/15862301/pexels-photo-15862301/free-photo-of-woman-with-sunglasses-posing-near-ladder.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//     ];

//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // Deux éléments par ligne.
//         childAspectRatio: 0.7,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 8,
//       ),
//       itemCount: wallpapers.length,
//       itemBuilder: (context, index) {
//         final wallpaperUrl = wallpapers[index];
//         return Image.network(wallpaperUrl);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:wallpaper_ui/data/models/wallpaper_model.dart';
import 'package:wallpaper_ui/data/repositories/wallpaper_repository.dart';

class WallpaperList extends StatelessWidget {
  const WallpaperList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utilisez le WallpaperRepository pour récupérer les fonds d'écran depuis l'API.
    final wallpaperRepository = WallpaperRepository();
    return FutureBuilder<List<Wallpaper>>(
      future: wallpaperRepository.fetchWallpapers(),
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
              return Image.network(wallpaper.src
                  .portrait); // Utilisez l'URL de l'image du modèle Wallpaper
            },
          );
        } else {
          return const Text('Aucune donnée disponible.');
        }
      },
    );
  }
}
