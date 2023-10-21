import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'dart:io';

Future<void> downloadImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  //get image name
  final imgName = path.basename(imageUrl);
  //get doc directory
  final directory = await path_provider.getApplicationDocumentsDirectory();
  // Obtenez le répertoire de documents de l'application.
  final filePath = path.join(directory.path, imgName);

  //downloading
  final imageFile = File(filePath);
  await imageFile.writeAsBytes(response.bodyBytes);
}
