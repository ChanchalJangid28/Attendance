import 'dart:convert';
import 'dart:math';
import 'dart:core';
import 'package:attendence_app/Utils/baseurls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Models/inmodel.dart';
import 'inevents.dart';
import 'instates.dart';

class InBloc extends Bloc<InEvents,InStates>{
InBloc():super(InInitialState());
markIn(String date) async{
  emit(InLoadingState());
  SharedPreferences prefs=await SharedPreferences.getInstance();
  String? token=prefs.getString('token');
  String? userid=prefs.getString('userId');
  final response=await http.post(Uri.parse(BaseUrls.MarkIn),headers: {
  'Content-Type':'application/json',
  'Authorization':token!
  },
  body: jsonEncode({
    "user":userid!,
    "createat":date
  }));

  if(response.statusCode==200){
      Map<String,dynamic> responsedata=jsonDecode(response.body);
      InModel inModel=InModel.fromJson(responsedata);
      emit(InLoadedState(inModel: inModel));
  }
  else{
      Map<String,dynamic> error= jsonDecode(response.body);
      String errormsg=error['message'];
      emit(InErrorState(errormsg: errormsg));
  }
}
}