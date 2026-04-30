import 'package:flutter/material.dart';
import 'package:virtual_card/constaints/dragitem.dart';
import 'package:virtual_card/models/contactmodel.dart';

class Contactform extends StatefulWidget {
  static const String routername = "contactform";
  final Contactmodel contactinfo;
  const Contactform({super.key, required this.contactinfo});

  @override
  State<Contactform> createState() => _ContactformState();
}

class _ContactformState extends State<Contactform> {
  final _formkey = GlobalKey<FormState>();
  final nameControler = TextEditingController();
  final mobileControler = TextEditingController();
  final emailControler = TextEditingController();
  final addressControler = TextEditingController();
  final websiteControler = TextEditingController();
  final companyControler = TextEditingController();
  final designationcontroler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    nameControler.text = widget.contactinfo.name;
    designationcontroler.text = widget.contactinfo.designation;
    mobileControler.text = widget.contactinfo.mobile;
    emailControler.text = widget.contactinfo.email;
    addressControler.text = widget.contactinfo.address;
    websiteControler.text = widget.contactinfo.website;
    companyControler.text = widget.contactinfo.company;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameControler.dispose();
    mobileControler.dispose();
    emailControler.dispose();
    addressControler.dispose();
    websiteControler.dispose();
    designationcontroler.dispose();
    companyControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Form Page")),

      body: Form(
        key: _formkey,
        child: Card(
          color: const Color.fromARGB(255, 204, 179, 200),
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameControler,
                  decoration: InputDecoration(label: Text("Name")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: designationcontroler,
                  decoration: InputDecoration(label: Text("Designation")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobileControler,
                  decoration: InputDecoration(label: Text("Mobile")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailControler,
                  decoration: InputDecoration(label: Text("Email")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: addressControler,
                  decoration: InputDecoration(label: Text("Address")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: companyControler,
                  decoration: InputDecoration(label: Text("Company")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: websiteControler,
                  decoration: InputDecoration(label: Text("Website")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errormsgforempty;
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: savecontacts,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Save Contacts"),
                      SizedBox(width: 5),
                      Icon(Icons.save),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void savecontacts() {
    if (_formkey.currentState!.validate()) {
      widget.contactinfo.name = nameControler.text;
      widget.contactinfo.email = emailControler.text;
      widget.contactinfo.mobile = mobileControler.text;
      widget.contactinfo.address = addressControler.text;
      widget.contactinfo.website = websiteControler.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('Contact saved successfully!'),
            ],
          ),
          backgroundColor: Colors.green[600],
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3), // Standard duration
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }
}
