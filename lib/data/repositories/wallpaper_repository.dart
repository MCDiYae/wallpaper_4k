import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_ui/core/utils/constant.dart';
import '../models/wallpaper_model.dart';

class WallpaperRepository {
  // Future<List<Wallpaper>> fetchWallpapers() async {
  //   try {
  //     final response = await http.get(
  //         Uri.parse('https://api.pexels.com/v1/curated?per_page=20&page=3'),
  //         headers: {"Authorization": restApiKey});
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response
  //           .body); //Cjson.decode convertit le corps de la réponse HTTP en un objet Dart
  //       final List<dynamic> photos = data["photos"];
  //       return photos.map((json) => Wallpaper.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Impossible de récupérer les fonds d\'écran ');
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future<List<Wallpaper>> fetchWallpaperByCategory(String category) async {
    final response = await http.get(
      Uri.parse(
          'https://api.pexels.com/v1/search?query=$category&per_page=30&page=1'),
      headers: {"Authorization": restApiKey},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> photos = data["photos"];
      return photos.map((json) => Wallpaper.fromJson(json)).toList();
    } else {
      throw Exception(
          "Impossible de récupérer les fonds d'écran pour la catégorie : $category");
    }
  }
}
