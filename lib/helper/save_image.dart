import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpaper_ui/helper/permission.dart';

Future<void> saveImage(String imageUrl, BuildContext context) async {
  bool permissionGranted = await requestStoragePermission();

  if (permissionGranted) {
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));

    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: 'mywall');
    if (context.mounted) {
      if (result != null) {
        showMessage(context, 'SUCCES');
      } else {
        showMessage(context, 'Failed');
      }
    }
  } else {
    print('L\'utilisateur a refusé l\'autorisation d\'accès au stockage.');
  }
}

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
