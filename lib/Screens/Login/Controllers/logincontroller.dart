import 'dart:developer';

import 'package:attendence_app/Screens/Login/Blocs/loginbloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logincontroller{
  static logIn(String email,String password,BuildContext context){
    if(email==""||password=="")
      return log("Enter required field's");
    else{
      context.read<LoginBloc>().logIn(email, password);
      log("Login successful");
    }
  }
}