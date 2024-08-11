import 'dart:convert';

import 'package:attendence_app/Utils/baseurls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../OutModel/outmodel.dart';
import 'outevents.dart';
import 'outstates.dart';

class OutBloc extends Bloc<OutEvents,OutStates>{
  OutBloc():super(OutInitialState());
  markOut(String date,String workdetails)async{
    emit(OutLoadingState());
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? userid=prefs.getString("userId");
    String? token=prefs.getString("token");
    final response=await http.post(Uri.parse(BaseUrls.MarkOut),headers: {
      'Content-Type':'application/json',
      'Authorization':token!
    },body:jsonEncode({
      "user":userid,
      "createdat":date,
      "workdetails":workdetails
    })
    );
    if(response.statusCode==200){
      Map<String,dynamic> responsedata=jsonDecode(response.body);
      OutModel outModel=OutModel.fromJson(responsedata);
      emit(OutLoadedState(outModel: outModel));
    }
    else{
      Map<String,dynamic>error=jsonDecode(response.body);
      String errormsg=error['message'];
      emit(OutErrorState(errormsg: errormsg));
    }
  }
}