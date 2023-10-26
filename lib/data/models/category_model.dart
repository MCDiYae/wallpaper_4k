import 'package:wallpaper_ui/core/utils/assets.dart';

class Category {
  final String name;
  final String imageAsset;

  Category({
    required this.name,
    required this.imageAsset,
  });
}

final List<Category> categories = [
  Category(name: 'Nature', imageAsset: AssetsData.natureWall),
  Category(name: 'Flowers', imageAsset: AssetsData.flowerwall),
  Category(name: 'Beautiful', imageAsset: AssetsData.beautywall),
  Category(name: 'ART', imageAsset: AssetsData.artwall),
  Category(name: 'Travel', imageAsset: AssetsData.travelWall),
  Category(name: 'Beach', imageAsset: AssetsData.beachWall),
  Category(name: '4k Wallpaper', imageAsset: AssetsData.wall4K),

  // Ajoutez d'autres catégories ici 4k wallpaper
];
