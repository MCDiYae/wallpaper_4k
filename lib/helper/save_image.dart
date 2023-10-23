import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:wallpaper_ui/helper/permission.dart';

Future<void> saveImage(String imageUrl) async {
  bool permissionGranted = await requestStoragePermission();

  if (permissionGranted) {
    var response = await Dio()
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));

    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: 'mywall');

    if (result != null) {
      print('Image sauvegardée avec succès dans la galerie.');
    } else {
      print('Échec de la sauvegarde de l\'image.');
    }
  } else {
    print('L\'utilisateur a refusé l\'autorisation d\'accès au stockage.');
  }
}
