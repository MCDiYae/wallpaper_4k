import 'package:flutter/material.dart';
import 'package:wallpaper_ui/core/utils/constant.dart';
import 'package:wallpaper_ui/core/utils/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  const MyAppBar({
    super.key,
    required this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Styles.sTyleTitle,
      ),
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
      toolbarHeight: 64,
      centerTitle: true,
      backgroundColor: backgroundColorAppBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
