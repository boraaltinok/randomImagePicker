import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FolderImageController extends GetxController {
  final imageFiles = RxList<File>([]);

  Future<void> selectFolder() async {
    final result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      final folder = Directory(result);
      final imageExtensions = ['.jpg', '.jpeg', '.png'];

      print("resuladt ${folder}");


      final files = folder
          .listSync(recursive: false)
          .where((entity) => entity is File)
          .map((entity) => entity as File)
          .where((file) =>
          imageExtensions.contains(path.extension(file.path).toLowerCase()))
          .toList();

      await for (var entity in folder.list()) {
        if (entity is File) {
          final file = entity as File;
          final extension = path.extension(file.path);
          if (imageExtensions.contains(extension.toLowerCase())) {
            files.add(file);
            print('File extension: $extension');
          }
        }
      }

      if (files.isNotEmpty) {
        for (final file in files) {
          final extension = path.extension(file.path);
          print('File extension: $extension');
        }
        imageFiles.value = files;
        print('Files are not empty');
      } else {
        print('Files are empty');
      }
    }
  }


  List<File> getRandomImages() {
    final List<File> randomImages = [];
    final Random random = Random();
    print("here");
    print(imageFiles.value);

    while (randomImages.length < 5 && imageFiles.isNotEmpty) {
      final int randomIndex = random.nextInt(imageFiles.length);
      randomImages.add(imageFiles[randomIndex]);
      imageFiles.removeAt(randomIndex);
    }

    return randomImages;
  }
}
