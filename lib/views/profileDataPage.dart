import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excel/controller/firebaseController.dart';
import 'package:get/get.dart';

import '../helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var documentId = Get.arguments[0];

  final FirebaseController firebaseController = Get.put(FirebaseController());

  final _formKey = GlobalKey<FormState>();

  final anyTextEditController = new TextEditingController();

  var uid;


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    CollectionReference users =
    FirebaseFirestore.instance.collection('userdata');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 5,
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black54,
            body: Center(
                child: Text(
                  "Something went wrong",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
          );
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Scaffold(
            backgroundColor: Colors.black54,
            body: Center(
                child: Text(
                  "Document does not exist",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic>;
          var entryList = data.entries.toList();

          ///for generate controllers
          List _controllersListFromfirestore = [];
          var uidList = [];
          List textEditingControllers = <TextEditingController>[];
          var textFields = <TextField>[];



          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: text("Profile", 20, Colors.white,
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
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                for (var i = 0; i < entryList.length; i++){
                                  _controllersListFromfirestore.add(entryList[i].value.toString());
                                }
                                // _controllersListFromfirestore.clear();
                                // uidList.clear();
                                //_controllersListFromfirestore.addAll(entryList.map((element) => element.value));
                                _controllersListFromfirestore.forEach((str) {
                                  var textEditingController = new TextEditingController(text: str);
                                  textEditingControllers.add(textEditingController);
                                  return textFields.add(
                                    TextField(
                                      onTap: (){},
                                        controller: textEditingController,
                                    ),
                                  );
                                });
                                  // uidList.addAll(entryList.where((element) {
                                  //   if(element.key.toString() == "uid"){
                                  //     return true;
                                  //   } else return false;
                                  // }));
                                  print(_controllersListFromfirestore.length);
                                print(textEditingControllers.toString());
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: textFields,
                                );

                                  //return row(index,entryList); /// _controllersListFromfirestore
                              },
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
  }

 //  Widget row(
 //      int index,
 //      dynamic entryList,
 //      ) {
 //
 //    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
 //    //   uid = uidList[0].value.toString();
 //    // });
 //
 //
 //
 //
 //    print("lenght : " + _controllersListFromfirestore.length.toString());
 //
 //    //
 //    // print("uid leng" + uidList.length.toString());
 //    //
 //    // print(uidList[0].value.toString());///user id::::::::::::::
 //
 //    print(textEditingControllers.toString());
 //
 //
 //
 // // var a =   textEditingControllers.map((e)  {
 // //   print(e.text);
 // //   print(e.value.toString() +": *****vaaaaaaaaaaaaaaaaaaaaaaaal");
 // //      return e.value.text.toString();
 // //    });
 // //    print("Controllers ::"+a.toString()  );
 //
 //   // print(
 //   //     _controllersListFromfirestore.map((e){
 //   //       return e[0].toString();
 //   //     })
 //   // );
 //
 //
 //
 //    return Column(
 //      mainAxisAlignment: MainAxisAlignment.start,
 //      crossAxisAlignment: CrossAxisAlignment.start,
 //      children: textFields,
 //      // [
 //      //
 //      //   Text(
 //      //     entryList[index].key.toString(),
 //      //     style: TextStyle(
 //      //       fontSize: 20.0,
 //      //       color: Colors.black,
 //      //       fontWeight: FontWeight.bold,
 //      //     ),
 //      //   ),
 //      //   SizedBox(
 //      //     height: 10,
 //      //   ),
 //      //   Container(
 //      //     width: MediaQuery
 //      //         .of(context)
 //      //         .size
 //      //         .width * 0.9,
 //      //     color: Colors.pinkAccent.withOpacity(0.4),
 //      //     child: ListTile(
 //      //       title: Text(
 //      //         entryList[index].value.toString(),
 //      //         style: TextStyle(
 //      //           fontSize: 20.0,
 //      //           color: Colors.black,
 //      //           fontWeight: FontWeight.normal,
 //      //         ),
 //      //       ),
 //      //       trailing: InkWell(
 //      //         onTap: () {
 //      //           if (entryList[index].key.toString() == "uid") {
 //      //             Get.snackbar(
 //      //               "Error",
 //      //               "You Cannot change uid...!",
 //      //               icon: Icon(
 //      //                 Icons.error_outline,
 //      //                 color: Colors.white,
 //      //               ),
 //      //               snackPosition: SnackPosition.BOTTOM,
 //      //               backgroundColor: Colors.red,
 //      //               colorText: Colors.white,
 //      //             );
 //      //           } else {
 //      //             update(
 //      //               entryList[index].key.toString(),
 //      //               entryList[index].value.toString(),
 //      //             );
 //      //           }
 //      //         },
 //      //         child: Icon(
 //      //           Icons.edit,
 //      //           color: Colors.blue,
 //      //           size: 30,
 //      //         ),
 //      //       ),
 //      //     ),
 //      //   ),
 //      // ],
 //     );
 //  }

  Future<void> update(String name, String value) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update ' + name),
          content: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: ListBody(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    textField(0, "Update $name", 1, anyTextEditController),
                    SizedBox(height: 20,),
                    button(
                        context,
                        Colors.orange,
                        1,
                        50,
                        10.0,
                        "Update",
                        Colors.white,
                        18.0,
                        FontWeight.bold, () {
                      if (_formKey.currentState!.validate()) {
                        print("Validate");
                        firebaseController.updateData(
                            uid, name, anyTextEditController.text.toString());
                        anyTextEditController.clear();
                        Get.back();
                      } else {
                        print("Not Validate");
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
