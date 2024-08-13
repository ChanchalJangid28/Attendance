import 'dart:convert';

import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveBlocs/leaveEvents.dart';
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveBlocs/leaveStates.dart';
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveModel/LeaveModel.dart';
import 'package:attendence_app/Utils/baseurls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class LeaveBloc extends Bloc<LeaveEvents,LeaveStates>{
  LeaveBloc():super(LeaveInitialState());
  provideLeave(String startLeaveDate,String endLeaveDate,String reason)async{
    emit(LeaveLoadingState());
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? userid=prefs.getString("userId");
    String? token=prefs.getString("token");
    final response=await http.post(Uri.parse(BaseUrls.leave),headers: {
      'Content-Type':'application/json',
      'Authorization':token!
    },body:jsonEncode({
      "user":userid,
      "startleavedate":startLeaveDate,
      "endleavedate":endLeaveDate,
      "reason":reason
    })
    );
    if(response.statusCode==200){
      Map<String,dynamic> responsedata=jsonDecode(response.body);
      LeaveModel leaveModel=LeaveModel.fromJson(responsedata);
      emit(LeaveLoadedState(leaveModel: leaveModel));
    }
    else{
      Map<String,dynamic>error=jsonDecode(response.body);
      String errormsg=error['message'];
      emit(LeaveErrorState(errormsg: errormsg));
    }
  }
}