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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
            margin: const EdgeInsets.only(left: 12, top: 12),
            decoration: BoxDecoration(
              color: backgroundColorAppBar, // Use the theme color here
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when the back button is pressed
              },
            ),
          ),
        ),
        body: WallpaperBody(imageUrl: imageUrl),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            saveImage(imageUrl, context);
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
