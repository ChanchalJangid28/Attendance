import 'dart:convert';
import 'dart:developer';

import 'package:attendence_app/Screens/Login/Blocs/loginevents.dart';
import 'package:attendence_app/Screens/Login/Blocs/loginstates.dart';
import 'package:attendence_app/Screens/Login/Models/loginmodels.dart';
import 'package:attendence_app/Utils/baseurls.dart';
import 'package:attendence_app/Utils/headers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LogInEvents,LogInStates>{
  LoginBloc():super(LogInInitialState());
  logIn(String email,String password)async{
      emit(LogInLoadingState());
      final response=await http.post(Uri.parse(BaseUrls.signin),headers: Headers.headers,
      body: jsonEncode({
          "email":email,
          "password":password
      }));
      if(response.statusCode==200){
        final SharedPreferences prefs=await SharedPreferences.getInstance();
        Map<String,dynamic>responseData=jsonDecode(response.body);
        String msg=responseData['message'];
        log(msg);
        String username=responseData['user']['username'];
        String email=responseData['user']['email'];
        String userId=responseData['user']['_id'];
        String token=responseData['token'];
        prefs.setString("userId", userId);
        prefs.setString("token", token);
        prefs.setString("username", username);
        prefs.setString("email", email);
        prefs.setBool("isLogin", true);
        LogInModel logInModel=LogInModel.fromJson(responseData);
        emit(LogInLoadedState(logInModel: logInModel));
      }else{
          Map<String,dynamic> error=jsonDecode(response.body);
          String errormsg=error['message'];
          emit(LogInErrorState(errormsg: errormsg));
      }
  }

}