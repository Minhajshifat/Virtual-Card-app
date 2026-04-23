import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class Scanpage extends StatefulWidget {
  static const String routername = "scanpage";
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

class _ScanpageState extends State<Scanpage> {
  var txtlines = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan Page")),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  getimage(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: const Text("Capture"),
              ),
              TextButton.icon(
                onPressed: () {
                  getimage(ImageSource.gallery);
                },
                icon: Icon(Icons.photo_album),
                label: const Text("Gallery"),
              ),
            ],
          ),
          Wrap(
            children: txtlines.map((line) => Showlines(line: line)).toList(),
          ),
        ],
      ),
    );
  }

  void getimage(ImageSource camera) async {
    final xfile = await ImagePicker().pickImage(source: camera);
    if (xfile != null) {
      EasyLoading.show(status: "Please wait");
      final textreconizer = TextRecognizer(script: TextRecognitionScript.latin);
      final reconizedtext = await textreconizer.processImage(
        InputImage.fromFile(File(xfile.path)),
      );
      EasyLoading.dismiss();
      final tmp = <String>[];
      for (var block in reconizedtext.blocks) {
        for (var lines in block.lines) {
          tmp.add(lines.text);
        }
      }
      setState(() {
        txtlines = tmp;
      });
    }
  }
}

class Showlines extends StatelessWidget {
  final String line;
  const Showlines({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      feedback: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          line,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(color: Colors.white54),
        ),
      ),
      child: Chip(label: Text(line)),
    );
  }
}
