import 'package:permission_handler/permission_handler.dart';

//Serviço para liberar a câmera.
Future<PermissionStatus> getCameraPermission() async {
  final status = await Permission.camera.request();
  return status;
}