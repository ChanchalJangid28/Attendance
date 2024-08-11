import 'dart:convert';
import 'dart:developer';

import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileBlocs/profileevents.dart';
import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileBlocs/profilestates.dart';
import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileModel/profileModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../../Utils/baseurls.dart';

class ProfileBloc extends Bloc<ProfileEvents,ProfileStates>{
  ProfileBloc():super(ProfileInitialState());
  fetchUser()async{
    emit(ProfileLoadingState());
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? userid=prefs.getString("userId");
    log("userId: $userid");
   // String? token=prefs.getString("token");

    final request = http.Request('GET', Uri.parse(BaseUrls.Profile));
    request.body=json.encode({"user": userid});

    final response = await http.Client().send(request);
    final responseBody = await response.stream.bytesToString();
    log('response body: $responseBody');
    if(response.statusCode==200){
      log(responseBody);
      Map<String,dynamic> responsedata=jsonDecode(responseBody);
      ProfileModel profileModel=ProfileModel.fromJson(responsedata);
      emit(ProfileLoadedState(profileModel: profileModel));
    }
    else{
      Map<String,dynamic>error=jsonDecode(responseBody);
      String errormsg=error['message'];
      emit(ProfileErrorState(errormsg: errormsg));
    }
  }
}