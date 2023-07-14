import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:image_picker/image_picker.dart';

import 'result_screen.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _scanning = false;
  XFile? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: const Text(
          'The Tesseract',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _pickedImage == null
                ? Container(
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey[400],
                    ),
                  )
                : Container(
                    color: Colors.grey[200],
                    child: Image.file(File(_pickedImage!.path)),
                  ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          setState(() {
            _scanning = true;
          });
          _pickedImage =
              (await _picker.pickImage(source: ImageSource.gallery))!;
          final _extractText = await FlutterTesseractOcr.extractText(
            _pickedImage!.path,
            language: 'carljasonmaneja',
            args: {
              "psm": "4",
              "preserve_interword_spaces": "1",
            },
          );
          setState(() {
            _scanning = false;
          });

          // Navigate to ResultScreen with the extracted text
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(extractedText: _extractText),
            ),
          );
        },
        icon: const Icon(Icons.image),
        label: const Text('Browse'),
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
