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
  Category(name: 'Fashion', imageAsset: AssetsData.natureWall),
  Category(name: 'ART', imageAsset: AssetsData.natureWall),
  Category(name: 'Travel', imageAsset: AssetsData.natureWall),
  Category(name: 'Beach', imageAsset: AssetsData.natureWall),
  Category(name: '4k Wallpaper', imageAsset: AssetsData.natureWall),

  // Ajoutez d'autres catégories ici 4k wallpaper
];
