import 'dart:developer';

import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveBlocs/leaveBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Widgets/uihelper.dart';

class LeaveController{
  static leave(String startLeaveDate,String endLeaveDate,String reason,BuildContext context){
    if(startLeaveDate==" " || endLeaveDate==" " || reason==" "){
      return Uihelper.CustomAlertBox("Enter Required Field's", context);
    }
    else{
      context.read<LeaveBloc>().provideLeave(startLeaveDate, endLeaveDate, reason);
      log("leave successful controller!");
    }
  }
}