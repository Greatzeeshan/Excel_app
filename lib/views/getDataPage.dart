import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/controller/firebaseController.dart';
import 'package:flutter_excel/views/profileDataPage.dart';
import 'package:flutter_excel/views/testingPage.dart';
import 'package:get/get.dart';

import '../helper.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseController firebaseController = Get.put(FirebaseController());

  final uidTextEditController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:
            text("Flutter Excel Get Data", 20, Colors.white, FontWeight.bold),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            textField(2, "Enter uid", media.width * 0.9, uidTextEditController),
            SizedBox(
              height: 20,
            ),
            button(context, Colors.orange, media.width * 0.8, 50, 10.0,
                "Get Data", Colors.white, 18.0, FontWeight.bold, () {
              if (_formKey.currentState!.validate()) {
                print("validate....");
                print(uidTextEditController.text);
                Get.to(ProfilePage(), arguments: [
                  uidTextEditController.text.toString(),
                ]);
                uidTextEditController.clear();
              } else {
                print("Not validate....");
              }
            }),
            SizedBox(
              height: 20,
            ),
            button(context, Colors.pinkAccent, media.width * 0.8, 50, 10.0,
                "Demo", Colors.white, 18.0, FontWeight.bold, () {
              if (_formKey.currentState!.validate()) {
                print("validate....");
                print(uidTextEditController.text);
                Get.to(TestingPage(), arguments: [
                  uidTextEditController.text.toString(),
                ]);
                uidTextEditController.clear();
              } else {
                print("Not validate....");
              }
            }),
          ],
        ),
      ),
    );
  }
}
