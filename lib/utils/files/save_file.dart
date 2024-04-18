import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> downloadAndSavePDF(BuildContext context) async {
  // Obtener la ruta del directorio de descargas en el dispositivo
  Directory directory = await getApplicationDocumentsDirectory();
  String documentPath = directory.path;

  // Nombre del archivo PDF y URL de origen
  String fileName = 'ejemplo.pdf';
  String url =
      'https://res.cloudinary.com/daij4l3is/image/upload/v1713458063/hiszwbxv17wop3acrijy.pdf';

  var status = await Permission.storage.status;
  if (status != PermissionStatus.granted) {
    status = await Permission.storage.request();
  }
  if (status.isGranted) {
    const downloadsFolderPath = '/storage/emulated/0/Download/';
    Directory dir = Directory(downloadsFolderPath);
    HttpClient httpClient = HttpClient();
    File file = File('$documentPath/$fileName');
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();
    await response.pipe(file.openWrite());
  }
  // Descargar el archivo PDF

  // Mostrar un diálogo de éxito después de la descarga
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Descarga completada'),
        content:
            Text('El archivo PDF se ha descargado en la carpeta de descargas.'),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
