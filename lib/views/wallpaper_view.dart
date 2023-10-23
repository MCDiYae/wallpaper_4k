import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/helper/save_image.dart';
import 'package:wallpaper_ui/widgets/wallpaper/wallpaperbody.dart';

///////////////

class WallpaperPage extends StatelessWidget {
  final String imageUrl;
  const WallpaperPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: const MyAppBar(title: ''),
        body: WallpaperBody(imageUrl: imageUrl),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            saveImage(imageUrl);
          },
          backgroundColor: backgroundColorAppBar,
          child: const Icon(
            Icons.download,
            color: primaryColor2,
          ),
        ),
      ),
    );
  }
}
