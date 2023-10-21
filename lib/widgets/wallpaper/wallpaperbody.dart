import 'package:flutter/material.dart';

class WallpaperBody extends StatelessWidget {
  final String imageUrl;
  const WallpaperBody({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
