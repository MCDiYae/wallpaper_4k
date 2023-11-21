import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/views/wallpaper_view.dart';
import 'package:wallpaper_ui/widgets/myappbar.dart';
import 'package:wallpaper_ui/data/models/wallpaper_model.dart';
import 'package:wallpaper_ui/data/repositories/wallpaper_repository.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: const MyAppBar(title: 'search'),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: "Search your wallpaper",
              suffixIcon: Icon(
                Icons.search,
              ),
              prefixIconColor: primaryColor2,
            ),
          )),
    ));
  }
}
