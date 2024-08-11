import 'package:attendence_app/Screens/Login/Models/loginmodels.dart';

abstract class LogInStates{}
class LogInInitialState extends LogInStates{}
class LogInLoadingState extends LogInStates{}
class LogInLoadedState extends LogInStates{
  LogInModel logInModel;
  LogInLoadedState({required this.logInModel});
}
class LogInErrorState extends LogInStates{
  String errormsg;
  LogInErrorState({required this.errormsg});
}