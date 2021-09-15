import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/helper.dart';
import 'package:get/get.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({Key? key}) : super(key: key);

  @override
  _TestingPageState createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  var documentId = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    CollectionReference users =
    FirebaseFirestore.instance.collection('userdata');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done){

          var stringListReturnedFromApiCall = [];/// "first", "second", "third", "fourth", "five"

          // This list of controllers can be used to set and get the text from/to the TextFields
          var textEditingControllers = <TextEditingController>[];

          var textFields = <TextField>[];


          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          var entryList = data.entries.toList();

            if(entryList.length != null){
              stringListReturnedFromApiCall.addAll(entryList.map((element) => element.value.toString()));
            }
            print("check ::::::::::::::::::");

          stringListReturnedFromApiCall.forEach((str) {
            var textEditingController = new TextEditingController(text: str);
            textEditingControllers.add(textEditingController);
            return textFields.add(new TextField(controller: textEditingController));
          });

          print("Length :: " + stringListReturnedFromApiCall.length.toString());
          print("All Controllers :: "+textEditingControllers.length.toString());

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: text("Flutter Excel Get Data", 20, Colors.white,
                    FontWeight.bold),
              ),
              body: Row(
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          text("Personal Information", 20, Colors.black,
                              FontWeight.bold),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: textFields,
                          ),
                          SizedBox(height: 25,),
                          button(context, Colors.orange, media.width*0.8, 50, 10.0,"Update", Colors.white, 18.0, FontWeight.bold, (){}),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.05,
                  ),
                ],
              ));
        }
        return Text("loading");
      },
    );

    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Testing Demo"),
    //     ),
    //     body: SingleChildScrollView(
    //         child: new Column(
    //           children: textFields,
    //         )));
  }
}

