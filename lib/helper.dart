import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';


///********Dot Widget
Widget dot(int index){
  return Container(
    height: 15,
    width: 15,
    decoration: BoxDecoration(
      color: index == 1 ? Get.theme.primaryColor : Colors.white,
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: Get.theme.primaryColor, width: 2),
    ),
  );
}

String? vali(value){
  if(value.isEmpty){
    return 'Required*';
  }
  return null;
}



///******TextFormField******///
textField(int index, String hint, double width, TextEditingController? controller) {
  return Container(
    height: 80,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: TextFormField(
        validator: vali,
        //keyboardType: index == 0 ? TextInputType.emailAddress :TextInputType.text,
        //obscureText: index == 1 ? true : false,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon:
          index == 0 ? Icon(Icons.check_circle, size: 20, color: Get.theme.primaryColor,)
          :index == 1 ? Icon(Icons.add, size: 20, color: Get.theme.primaryColor,)
          :index == 3 ? Icon(Icons.call, size: 20, color: Get.theme.primaryColor,)
          :index == 4 ? Icon(Icons.location_on, size: 20, color: Get.theme.primaryColor,)
          :index == 11 ? Icon(Icons.person, size: 20, color: Get.theme.primaryColor,)
          : Icon(Icons.lock, size: 20, color: Get.theme.primaryColor,),
          suffixIcon: index== 11? Icon(Icons.arrow_drop_down, size: 30, color: Get.theme.primaryColor,) : null,
          //labelText: name,
          hintText: hint,
          hintStyle: TextStyle(
            color: Get.theme.focusColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}


description(String name){
  return Row(
    children: [
      Expanded(
        child: Text(
          name,
          style: TextStyle(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.justify,
          //maxLines: 6,
          //overflow: TextOverflow.ellipsis,
          // softWrap: false,
        ),
      ),
    ],
  );
}
///text("Welcome to Digital Cab",20,Get.theme.accentColor,FontWeight.bold),
/// TEXT
text(String txt, double size, Color clr, FontWeight fw){
  return Text(
    txt,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: clr,
      fontSize: size,
      fontWeight: fw,
    ),
  );
}

///********Social Icon Button*****///
//Social Button
socialButton(int index, String name, double width,Function validate){
  return InkWell(
    onTap: (){
      validate();
    },
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: width,
          height: 40,
          child: Row(
            children: [
              Container(
                  width: 30,
                  height: 30,
                  child: index == 0 ?
                  Image(image: AssetImage('assets/images/google.png'),fit: BoxFit.cover,color: Colors.green,)
                      :
                  Image(image: AssetImage('assets/images/facebook.png'),fit: BoxFit.cover,color: Colors.blue,)
              ),
              SizedBox(width: 20,),
              text(name,20,Get.theme.accentColor,FontWeight.bold),
            ],
          ),
        ),
      ),
    ),
  );
}

///button(context, Colors.orange, media.width*0.8, 50, 10.0,"Allow", Colors.white, 18.0, FontWeight.bold, (){}),
///******Button******///
button(
    BuildContext context,
    Color clr,
    double width,
    double height,
    double raduis,
    String name,
    Color tclr,
    double size,
    FontWeight fw,
    Function() validate){
  return InkWell(
    onTap: (){
      validate();
    },
    child: Container(
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(raduis),
      ),
      width: MediaQuery.of(context).size.width*width,
      height: height,
      child: Center(
        child: Text(
          name, style: TextStyle(
          letterSpacing: 1.5,
            color: tclr,
            fontSize: size,
          fontWeight: fw,
        ),
        ),
      ),
    ),
  );
}