import 'dart:developer';

import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveBlocs/leaveBloc.dart';
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveBlocs/leaveStates.dart';
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveController/leaveController.dart';
import 'package:attendence_app/Screens/Home/Profile/profilepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../Widgets/uihelper.dart';
import '../../homepage.dart';

class Leavepage extends StatefulWidget {
  const Leavepage({super.key});

  @override
  State<Leavepage> createState() => _LeavepageState();
}

class _LeavepageState extends State<Leavepage> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reasonTextController = TextEditingController();

  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate(BuildContext context, TextEditingController controller, DateTime selectedDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      final DateFormat formatter = DateFormat('d MMM y');
      controller.text = formatter.format(pickedDate);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xFF26235C),
        elevation: 0,

      ),
      body: BlocConsumer<LeaveBloc, LeaveStates>(listener: (context, state) {
        if (state is LeaveLoadedState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profilepage()));
          Uihelper.CustomAlertBox(
              state.leaveModel.message.toString(), context);

        } else if (state is LeaveErrorState) {
          log(state.errormsg.toString());
        }
      }, builder: (context, state) {
        if (state is LeaveLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xFF26235C)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 200,
              ),
              Container(
                width: 350,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color(0xFF3E3A84),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 20.0,
                      spreadRadius: 10.0,
                    )
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),
                      Text("Leave Details: ",style: TextStyle(color: Colors.white),),

                      Center(
                        child: Row(
                          children: [

                            //Uihelper.CustomTextField(workController, "", Icons.work, Colors.white, true, false),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListBody(
                                  children: <Widget>[
                                    TextField(
                                      controller: startDateController,
                                      decoration: InputDecoration(labelText: 'Start date'),
                                      onTap: () => _selectDate(context, startDateController, selectedDate1),
                                    ),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: endDateController,
                                      decoration: InputDecoration(labelText: 'End date'),
                                      onTap: () => _selectDate(context, endDateController, selectedDate2),
                                    ),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: reasonTextController,
                                      decoration: InputDecoration(labelText: 'Reason'),
                                    ),
                                  ],
                                ),
                              ),
                            ),


                          ],

                          mainAxisAlignment: MainAxisAlignment.center,
                        ),

                      ),
                      Uihelper.CustomElevatedButton((){
                        log("start date: ");
                        log(startDateController.text.toString());
                        LeaveController.leave(startDateController.text.toString(),endDateController.text.toString(),reasonTextController.text.toString(),context);

                      }, "submit", Colors.blue, Colors.white),
                      SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );


      }),
    );
  }
}
