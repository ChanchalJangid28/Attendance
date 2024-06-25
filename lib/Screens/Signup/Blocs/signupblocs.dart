import 'dart:convert';
import 'dart:developer';

import 'package:attendence_app/Screens/Signup/Blocs/signupevents.dart';
import 'package:attendence_app/Screens/Signup/Blocs/signupstates.dart';
import 'package:attendence_app/Screens/Signup/Models/signupmodel.dart';
import 'package:attendence_app/Utils/baseurls.dart';
import 'package:attendence_app/Utils/headers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBloc() : super(SignUpInitialStates());
  signup(String email, String password, String username) async {
    emit(SignUpLoadingStates());
    final response = await http.post(Uri.parse(BaseUrls.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {"email": email, "password": password, "username": username}));
    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      SignUpModel signUpModel = SignUpModel.fromJson(responsedata);
      log(responsedata.toString());
      emit(SignUpLoadedStates(signUpModel: signUpModel));
    } else {
      // Map<String,dynamic>errors=jsonDecode(response.body);
      // String errormsg=errors['message'];
      emit(SignUpErrorStates(errormsg: response.statusCode.toString()));
    }
  }
}
