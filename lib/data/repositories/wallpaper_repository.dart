import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_ui/core/utils/constant.dart';
import '../models/wallpaper_model.dart';

class WallpaperRepository {
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

  Future<List<Wallpaper>> searchWallpapers(String query) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.get(
      Uri.parse(
          'https://api.pexels.com/v1/search?query=$query&per_page=30&page=1'),
      headers: {"Authorization": restApiKey},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> photos = data["photos"];
      return photos.map((json) => Wallpaper.fromJson(json)).toList();
    } else {
      throw Exception(
          "Impossible de récupérer les fonds d'écran pour la recherche : $query");
    }
  }
}
