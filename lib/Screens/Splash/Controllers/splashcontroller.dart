import 'package:attendence_app/Screens/Home/homepage.dart';
import 'package:attendence_app/Screens/Login/login.dart';
import 'package:attendence_app/Screens/Signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController{
  static checkUser(BuildContext context) async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    bool? isLogin=prefs.getBool("isLogin");
    if(isLogin!=null){
      if(isLogin)
        return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      else
        return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
    }
    else{
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }

}
}