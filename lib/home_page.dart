import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_image_picker/text_input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Image Pikcer"),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextInputField(controller: TextEditingController(), labelText: "Number of Images", icon: Icons.numbers, textInputType: TextInputType.number,),

          ],
        ),
      ),
    );
  }
}
