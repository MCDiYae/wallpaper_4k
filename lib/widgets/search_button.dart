import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/views/search_page.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(right: 16),
      icon: const Icon(
        Icons.search,
        color: primaryColor2,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ),
        );
      },
    );
  }
}
