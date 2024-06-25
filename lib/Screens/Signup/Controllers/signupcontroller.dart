import 'dart:developer';
import 'package:attendence_app/Screens/Signup/Blocs/signupblocs.dart';
import 'package:attendence_app/Widgets/uihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController{
 static signup(String email,String password,String username,BuildContext context){
    if(email=="" || password=="" || username==""){
      return Uihelper.CustomAlertBox("Enter Required Field's", context);
    }
    else{
      context.read<SignUpBloc>().signup(email, password, username);
      log("Success");
    }
  }
}