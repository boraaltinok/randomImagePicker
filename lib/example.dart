import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'image_controller.dart';

class ExamplePage extends StatelessWidget {
  final FolderImageController controller = Get.put(FolderImageController());

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Folder Image Viewer'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: ()async {
                    await controller.selectFolder();
                  },
                  child: const Text('Select Folder'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Selected Images:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Obx(() {
                    final List<File> randomImages = controller.getRandomImages();
                    return controller.imageFiles.value.isEmpty ?
                    Text("Empty") :
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (randomImages.length > index) {
                          return Image.file(randomImages[index]);
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  }),
                ),

              ],
            ),
          ),
        );


  }
}

