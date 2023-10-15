import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/core/utils/styles.dart';
import 'package:wallpaper_ui/widgets/home/liste_categories.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              nameApp,
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
          body: const ListCategories()),
    );
  }
}
