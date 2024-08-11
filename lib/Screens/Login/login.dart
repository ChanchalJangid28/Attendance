import 'dart:developer';

import 'package:attendence_app/Screens/Home/homepage.dart';
import 'package:attendence_app/Screens/Login/Blocs/loginbloc.dart';
import 'package:attendence_app/Screens/Login/Blocs/loginstates.dart';
import 'package:attendence_app/Screens/Login/Controllers/logincontroller.dart';
import 'package:attendence_app/Screens/Signup/signup.dart';
import 'package:attendence_app/Widgets/uihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF240046),
      ),
      body: BlocConsumer<LoginBloc,LogInStates>(listener: (context,state){
          if(state is LogInLoadedState){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }
          else if(state is LogInErrorState){
              log(state.errormsg.toString());
          }
      },
          builder: (context,state) {
            if (state is LogInLoadingState) {
             Center(child: CircularProgressIndicator(),);
           }
            return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF240046),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Log in",style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 30,),
                    Uihelper.CustomTextField(emailController, "Enter your mail", Icons.email,Colors.white,true,false),
                    SizedBox(height: 30,),
                    Uihelper.CustomTextField(passwordController, "Enter your password", Icons.password,Colors.white,true,true),

                    // Row(
                    //   children: [
                    //     Checkbox(value: false,onChanged: (bool? value){
                    //     },),
                    //     Text("Agree to",style: TextStyle(color: Colors.white),),InkWell(child: Text("Terms and conditions",style: TextStyle(
                    //         color: Colors.blue,
                    //         decoration: TextDecoration.underline
                    //     ),),)
                    //   ],
                    // ),
                    SizedBox(height:30 ,),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SizedBox(height: 40,
                          width: double.infinity,
                          child: Uihelper.CustomElevatedButton((){
                              Logincontroller.logIn(emailController.text.toString(), passwordController.text.toString(), context);
                          }, "Log In",Color(0xFF3A0CA3),Colors.white)),
                    ),
                    SizedBox(height: 30,),
                    Text("Or log in with",style: TextStyle(fontSize: 16,color: Colors.grey),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: [
                          SizedBox(height: 40,
                              width: double.infinity,
                              child: Uihelper.CustomElevatedButton((){
                               // Navigator.push(context,MaterialPageRoute(builder: (context)=>()) );
                              }, "Sign up with google",Color(0xFF3A0CA3),Colors.white)),
                          SizedBox(height: 20,),
                          SizedBox(height: 40,
                              width: double.infinity,
                              child: Uihelper.CustomElevatedButton((){
                              //  Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()) );
                              }, "Sign up with Facebook",Color(0xFF3A0CA3),Colors.white)),

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    // Text("Don't have an account?",style: TextStyle(color: Colors.grey),),InkWell(child: Text("Sign up",style: TextStyle(
                    //     color: Colors.blue,
                    //     decoration: TextDecoration.underline
                    // ),),),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));

                    }, child: Text("Create a New Account?",style: TextStyle(color: Colors.blue,
                        decoration: TextDecoration.underline),))
                  ],
                ),
              ),
            ),
                  );
          }
        )
    );
  }
}
