import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper_ui/core/utils/constant.dart';
import '../models/wallpaper_model.dart';

class WallpaperRepository {
  final String baseUrl = 'https://api.pexels.com/v1/curated';

  Future<List<Wallpaper>> fetchWallpapers() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl), headers: {"Authorization": restApiKey});
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> photos = data["photos"];
        return photos.map((json) => Wallpaper.fromJson(json)).toList();
      } else {
        throw Exception('Impossible de récupérer les fonds d\'écran ');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
