
import 'package:flutter/material.dart';
class Uihelper{
  static CustomTextField(TextEditingController controller,String text,IconData iconData,Color fillcolor,bool filled,bool obscureText){
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
        fillColor:fillcolor,
        filled:filled

      ),
    );

  }
  static CustomElevatedButton(VoidCallback callback,String text,Color backgroudColor,Color foregroundColor){
    return ElevatedButton(onPressed: (){
      callback();
    }, child: Text(text), style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(backgroudColor),
      foregroundColor: MaterialStatePropertyAll<Color>(foregroundColor),
    ),);
  }

  static CustomAlertBox(String text,BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("ok"))
        ],
      );
    });
  }
  
  static CustomIconButton(VoidCallback callback,String text,IconData iconData,Color backgroudColor,Color foregroundColor){
    return ElevatedButton.icon(onPressed: (){
      callback();
    },icon: Icon(iconData), label: Text(text),style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(backgroudColor),
      foregroundColor: MaterialStatePropertyAll<Color>(foregroundColor),
    ),);
  }

  static CustomAlertBoxWithTime(String text,String time,BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
        content: Text(time),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("ok"))
        ],
      );
    });
  }


}