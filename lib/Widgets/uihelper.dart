

import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveController/leaveController.dart';
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveModel/LeaveModel.dart';
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


  // static CustomAlertBoxForLeave(BuildContext context){
  //   final TextEditingController dateController1 = TextEditingController();
  //   final TextEditingController dateController2 = TextEditingController();
  //   final TextEditingController reasonTextController = TextEditingController();
  //
  //   DateTime selectedDate1 = DateTime.now();
  //   DateTime selectedDate2 = DateTime.now();
  //
  //   Future<void> _selectDate(BuildContext context, TextEditingController controller, DateTime selectedDate) async {
  //     final DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2000),
  //       lastDate: DateTime(2101),
  //     );
  //
  //     if (pickedDate != null && pickedDate != selectedDate) {
  //       controller.text = "${pickedDate.toLocal()}".split(' ')[0];
  //     }
  //   }
  //   return showDialog(context: context, builder: (BuildContext context){
  //
  //     return AlertDialog(
  //       title: Text('Enter Leave Information'),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: <Widget>[
  //             TextField(
  //               controller: dateController1,
  //               decoration: InputDecoration(labelText: 'Start date'),
  //               onTap: () => _selectDate(context, dateController1, selectedDate1),
  //             ),
  //             SizedBox(height: 10),
  //             TextField(
  //               controller: dateController2,
  //               decoration: InputDecoration(labelText: 'End date'),
  //               onTap: () => _selectDate(context, dateController2, selectedDate2),
  //             ),
  //             SizedBox(height: 10),
  //             TextField(
  //               controller: reasonTextController,
  //               decoration: InputDecoration(labelText: 'Reason'),
  //             ),
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text('Submit'),
  //           onPressed: () {
  //             LeaveController.leave(dateController1.text.toString(), dateController2.text.toString(), reasonTextController.text.toString(), context);
  //             Navigator.of(context).pop();
  //             Uihelper.CustomAlertBox("Leave has been created wait for the approvel.", context);
  //
  //           },
  //         ),
  //         TextButton(
  //           child: Text('Cancel'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     );
  //   },
  //   );
  // }
}