import 'package:flutter/material.dart';
import 'package:virtual_card/models/contactmodel.dart';

class Contactform extends StatefulWidget {
  static const String routername = "contactform";
  final Contactmodel contactinfo;
  const Contactform({super.key, required this.contactinfo});

  @override
  State<Contactform> createState() => _ContactformState();
}

class _ContactformState extends State<Contactform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Contact Form Page")));
  }
}
