import 'package:flutter/material.dart';
import 'package:wallpaper_ui/widgets/category/liste_wallpaper.dart';
import 'package:wallpaper_ui/widgets/myappbar.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: categoryName),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: WallpaperList(
            category: categoryName,
          ),
        ),
      ),
    );
  }
}
