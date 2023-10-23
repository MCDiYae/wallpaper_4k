import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  var status = Permission.storage.request();
  return status.isGranted;
}
