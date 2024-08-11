import 'dart:developer';


import 'package:attendence_app/Screens/Home/Attendence/attendencepage.dart';
import 'package:attendence_app/Screens/Home/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../Widgets/uihelper.dart';
import 'outBlocs/outbloc.dart';
import 'outBlocs/outstates.dart';
import 'outController/outcontroller.dart';

class OutPage extends StatefulWidget {

  @override
  State<OutPage> createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  bool istap=false;
  TextEditingController workController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Color(0xFF26235C),
        elevation: 0,

      ),
      body: BlocConsumer<OutBloc, OutStates>(listener: (context, state) {
        if (state is OutLoadedState) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          String date = state.outModel.data!.createdat.toString();
          DateTime dateTime = DateTime.parse(date);
          String formattedDate =
              DateFormat('dd MMMM yyyy h:mm a').format(dateTime);
          Uihelper.CustomAlertBoxWithTime(
              state.outModel.message.toString(), formattedDate, context);
        } else if (state is OutErrorState) {
          log(state.errormsg.toString());
        }
      }, builder: (context, state) {
        if (state is OutLoadingState) {
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
                      Text("Today's work details: ",style: TextStyle(color: Colors.white),),

                      Center(
                        child: Row(
                          children: [

                           //Uihelper.CustomTextField(workController, "", Icons.work, Colors.white, true, false),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextField(controller: workController,decoration: InputDecoration(
                                  hintText: "Enter your work details",
                                  fillColor: Colors.white,
                                  filled: true
                                ),),
                              ),
                            ),


                          ],

                          mainAxisAlignment: MainAxisAlignment.center,
                        ),

                      ),
                      Uihelper.CustomElevatedButton((){
                        DateTime date=DateTime.now();
                        String cretedat=date.toString();
                        OutController.markOut(cretedat,workController.text.toString(),context);
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AttendencePage()));
                        log("ok button tapped");
                        log(cretedat);
                        log(workController.text.toString());
                        // istap==false?  context
                        //     .read<OutBloc>()
                        //     .OutController.markOut(cretedat,workController.text.toString(),context);:Uihelper.CustomAlertBoxWithTime("Can't In Several Times", "Testing", context);
                        // setState(() {
                        //   istap=true;
                        //}
                      }, "OK", Colors.blue, Colors.white),
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
