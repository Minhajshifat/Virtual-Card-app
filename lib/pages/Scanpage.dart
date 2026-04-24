import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_card/constaints/dragitem.dart';

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
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dragcarditem(property: Cardinfo.name, ondrop: getproperties),
                  Dragcarditem(
                    property: Cardinfo.designation,
                    ondrop: getproperties,
                  ),
                  Dragcarditem(
                    property: Cardinfo.mobile,
                    ondrop: getproperties,
                  ),
                  Dragcarditem(property: Cardinfo.email, ondrop: getproperties),
                  Dragcarditem(
                    property: Cardinfo.address,
                    ondrop: getproperties,
                  ),
                  Dragcarditem(
                    property: Cardinfo.website,
                    ondrop: getproperties,
                  ),
                ],
              ),
            ),
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

void getproperties(String property, String dragitem) {}

class Showlines extends StatelessWidget {
  final String line;
  const Showlines({super.key, required this.line});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: line,
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
      child: Chip(
        label: Text(line, style: Theme.of(context).textTheme.labelMedium),
      ),
    );
  }
}

class Dragcarditem extends StatefulWidget {
  final String property;
  final Function(String property, String value) ondrop;
  const Dragcarditem({super.key, required this.property, required this.ondrop});

  @override
  State<Dragcarditem> createState() => _DragcarditemState();
}

class _DragcarditemState extends State<Dragcarditem> {
  String dragitem = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(widget.property)),
          Expanded(
            flex: 2,
            child: DragTarget<String>(
              builder: (context, candidateData, rejectedData) => Container(
                decoration: BoxDecoration(
                  border: candidateData.isNotEmpty
                      ? BoxBorder.all(color: Colors.green, width: 4)
                      : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(dragitem.isEmpty ? "Drop Here" : dragitem),
                    ),

                    if (dragitem.isNotEmpty)
                      InkWell(
                        onTap: () {
                          setState(() {
                            dragitem = "";
                          });
                        },
                        child: Icon(Icons.clear, color: Colors.red, size: 15),
                      ),
                  ],
                ),
              ),
              onAccept: (data) {
                setState(() {
                  if (dragitem.isEmpty) {
                    dragitem = data;
                  } else {
                    dragitem += ' , $data';
                  }
                  widget.ondrop(data, dragitem);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
