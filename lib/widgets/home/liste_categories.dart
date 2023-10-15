import 'package:flutter/material.dart';
import 'package:wallpaper_ui/data/models/category_model.dart';

import 'package:wallpaper_ui/widgets/home/card_category.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CardCategory(
            categoryName: category.name,
            imageAsset: category.imageAsset,
          );
        },
      ),
    );
  }
}
