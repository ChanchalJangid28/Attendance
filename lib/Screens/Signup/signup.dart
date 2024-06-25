import 'dart:developer';

import 'package:attendence_app/Screens/Signup/Blocs/signupblocs.dart';
import 'package:attendence_app/Screens/Signup/Blocs/signupstates.dart';
import 'package:attendence_app/Screens/Signup/Controllers/signupcontroller.dart';
import 'package:attendence_app/Screens/login.dart';
import 'package:attendence_app/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF240046),
        ),
        body: BlocConsumer<SignUpBloc, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpLoadedStates) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            } else if (state is SignUpErrorStates) {
               Uihelper.CustomAlertBox(
                  state.errormsg.toString(), context);
            }
          },
          builder: (context, state) {
            if (state is SignUpLoadingStates) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFF240046),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 50,
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Uihelper.CustomTextField(
                          emailController,
                          "Enter your mail",
                          Icons.email,
                          Colors.white,
                          true,
                          false),
                      const SizedBox(
                        height: 30,
                      ),
                      Uihelper.CustomTextField(
                          passwordController,
                          "Enter your password",
                          Icons.password,
                          Colors.white,
                          true,
                          true),
                      const SizedBox(
                        height: 30,
                      ),
                      Uihelper.CustomTextField(
                          nameController,
                          "Enter your name",
                          Icons.supervised_user_circle,
                          Colors.white,
                          true,
                          false),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: Uihelper.CustomElevatedButton(() {
                              BlocProvider.of<SignUpBloc>(context).signup(emailController.text.toString(), passwordController.text.toString(), nameController.text.toString());
                              log(emailController.text.toString());
                              log(passwordController.text.toString());
                              log(nameController.text.toString());
                              //  SignUpController.signup(emailController.text.toString(), passwordController.text.toString(), nameController.text.toString(), context);
                            }, "Sign up", const Color(0xFF3A0CA3),
                                Colors.white)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Or sign up with",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: Uihelper.CustomElevatedButton(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup()));
                                }, "Sign up with google",
                                    const Color(0xFF3A0CA3), Colors.white)),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: Uihelper.CustomElevatedButton(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup()));
                                }, "Sign up with Facebook",
                                    const Color(0xFF3A0CA3), Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const InkWell(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
