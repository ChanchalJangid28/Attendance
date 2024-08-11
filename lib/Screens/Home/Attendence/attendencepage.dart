import 'dart:developer';

import 'package:attendence_app/Screens/Home/Attendence/Out/outBlocs/outbloc.dart';
import 'package:attendence_app/Screens/Home/Attendence/Out/outpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';



import '../../../Widgets/uihelper.dart';
import 'In/Blocs/inbloc.dart';
import 'In/Blocs/instates.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({super.key});

  @override
  State<AttendencePage> createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  bool istap=false;
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Attendence"),
          backgroundColor: Color(0xFF26235C),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.work),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocConsumer<InBloc,InStates>(listener:(context,state){
            if(state is InLoadedState){
                String date=state.inModel.data!.createat.toString();
                dateTime=DateTime.parse(date);
                String formattedDate= DateFormat('dd MMMM yyyy h:mm a').format(dateTime!);
                Uihelper.CustomAlertBoxWithTime(state.inModel.message.toString(), formattedDate,context);
            }else if (state is InErrorState) {
               log(state.errormsg.toString());
            }
        },builder: (context,state) {
          if (state is InLoadingState) {
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
                    //color:Color(0xFF3E3A84),
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
                        Center(
                          child: Row(
                            children: [
                              Uihelper.CustomIconButton(() {
                                istap==false?  context
                                    .read<InBloc>()
                                    .markIn(DateTime.now().toString()):Uihelper.CustomAlertBoxWithTime("Can't In Several Times", "Testing", context);
                                setState(() {
                                  istap=true;
                                });
                              }, "In",
                                  Icons.transit_enterexit, Colors.blue,
                                  Colors.white),
                              SizedBox(
                                width: 30,
                              ),
                              Uihelper.CustomIconButton(() {
                                DateTime outdate=DateTime.now();
                                Duration difference;
                                if(dateTime==null){
                                  Uihelper.CustomAlertBox("you can't Out without In", context);
                                }else{
                                  difference=outdate.difference(dateTime!);
                                  if(istap && difference.inHours>=9){
                                    log("you can now click");
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>OutPage()) );
                                  }else{
                                    log("button can not be clicked");
                                    Uihelper.CustomAlertBox("You can not out before 9 hours", context);
                                  }
                                }



                              }, "Out",
                                  Icons.exit_to_app, Colors.blue, Colors.white),

                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        SizedBox(height: 100,),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
    ),



    );
  }
}
