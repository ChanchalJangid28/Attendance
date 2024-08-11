import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../outBlocs/outbloc.dart';

class OutController{
  static markOut(String date,String workDetails,BuildContext context){
    if(workDetails=="")
      return log("Please Enter work details");
    else{
      context.read<OutBloc>().markOut(date, workDetails);
      log("Out Successful");
    }
  }
}