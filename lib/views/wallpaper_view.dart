import 'package:flutter/material.dart';
import 'package:wallpaper_ui/widgets/myappbar.dart';
import 'package:wallpaper_ui/widgets/wallpaper/wallpaperbody.dart';

class WallpaperPage extends StatelessWidget {
  final String imageUrl;
  const WallpaperPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(title: 'Choose your wall'),
        body: WallpaperBody(imageUrl: imageUrl),
      ),
    );
  }
}
