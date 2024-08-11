

import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileModel/profileModel.dart';

abstract class ProfileStates{}

class ProfileInitialState extends ProfileStates{}
class ProfileLoadingState extends ProfileStates{}
class ProfileLoadedState extends ProfileStates{
  ProfileModel profileModel;
  ProfileLoadedState({required this.profileModel});
}
class ProfileErrorState extends ProfileStates{
  String errormsg;
  ProfileErrorState({required this.errormsg});
}