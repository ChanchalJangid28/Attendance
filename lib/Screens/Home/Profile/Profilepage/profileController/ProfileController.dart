import 'dart:developer';

import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileBlocs/profilebloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileController{
  static fetchUser(BuildContext context){

      context.read<ProfileBloc>().fetchUser();
      log("user fetch Successful");

  }
}