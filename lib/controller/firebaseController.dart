import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FirebaseController extends GetxController{
  var isLoading = false.obs;

  Future uploadData(uid, heading, desc) async{

    await FirebaseFirestore.instance
        .collection("userdata")
        .doc(uid)
        .set({
      "uid": uid,
      "$heading":desc,
    }).then((value) {
      print("inserted");
      isLoading(false).obs;
      Get.snackbar(
        "Success",
        "Data Inserted successfully!...",
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.6),
        colorText: Colors.white,
      );
    }).onError((error, stackTrace) {
      isLoading(false).obs;
      Get.snackbar(
        "Error",
        "Something Went wrong, Try Again...",
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: Colors.white,
      );
      print("error check insert "+error.toString());
    });

  }

  Future updateData(uid,name,desc) async{

    await FirebaseFirestore.instance
        .collection("userdata")
        .doc(uid)
        .update({
      "$name" : "$desc",
    }).then((value) {
      print("Updated");
      isLoading(false).obs;
      Get.snackbar(
        "Success",
        "Data Updated successfully!...",
        icon: Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.6),
        colorText: Colors.white,
      );
    }).onError((error, stackTrace) {
      isLoading(false).obs;
      Get.snackbar(
        "Error",
        "Something Went wrong, Try Again...",
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: Colors.white,
      );
      print("error check insert "+error.toString());
    });

  }


}