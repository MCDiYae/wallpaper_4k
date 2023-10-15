import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/views/category.dart';

class CardCategory extends StatelessWidget {
  final String categoryName;
  final String imageAsset;
  const CardCategory(
      {super.key, required this.categoryName, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          //on ajoute
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(
                categoryName: categoryName,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageAsset), fit: BoxFit.cover),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 32,
                  backgroundColor: backgroundColor.withOpacity(0.5)),
            ),
          ),
        ),
      ),
    );
  }
}
