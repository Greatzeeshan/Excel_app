import 'package:flutter/material.dart';
import 'package:flutter_excel/controller/firebaseController.dart';
import 'package:flutter_excel/views/getDataPage.dart';
import 'package:get/get.dart';

import '../helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();

  final FirebaseController firebaseController = Get.put(FirebaseController());

  final uidTextEditController = new TextEditingController();

  final headingTextEditController = new TextEditingController();
  final valueTextEditController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: text("Flutter Excel",20,Colors.white,FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              textField(2,"Enter uid",media.width*0.9,uidTextEditController),
              SizedBox(height: 20,),
              textField(0,"Enter heading",media.width*0.9,headingTextEditController),
              SizedBox(height: 20,),
              textField(1,"Enter Data",media.width*0.9,valueTextEditController),
              SizedBox(height: 20,),
              button(context, Colors.orange, media.width*0.8, 50, 10.0,"Enter Data", Colors.white, 18.0, FontWeight.bold, (){
                if(_formKey.currentState!.validate()){
                  print("validate....");
                  print(headingTextEditController.text);
                  print(valueTextEditController.text);
                  firebaseController.uploadData(
                    uidTextEditController.text.toString(),
                    headingTextEditController.text.toString(),
                    valueTextEditController.text.toString(),
                  );
                  uidTextEditController.clear();
                  headingTextEditController.clear();
                  valueTextEditController.clear();
                }else{
                  print("Not validate....");
                }
              }),
              SizedBox(height: 20,),
              button(context, Colors.green, media.width*0.8, 50, 10.0,"Next Get Data", Colors.white, 18.0, FontWeight.bold, (){
                Get.to(DataPage());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
