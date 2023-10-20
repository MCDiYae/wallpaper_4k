import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/widgets/home/liste_categories.dart';
import 'package:wallpaper_ui/widgets/myappbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          appBar: MyAppBar(
            title: nameApp,
          ),
          body: ListCategories()),
    );
  }
}
