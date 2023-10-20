import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/core/utils/styles.dart';
import 'package:wallpaper_ui/widgets/category/liste_wallpaper.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;
  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName,
            style: Styles.sTyleTitle,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
          ),
          toolbarHeight: 64,
          centerTitle: true,
          backgroundColor: backgroundColorAppBar,
        ),
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
