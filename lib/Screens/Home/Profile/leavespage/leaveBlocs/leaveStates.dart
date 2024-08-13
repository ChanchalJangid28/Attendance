
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveModel/LeaveModel.dart';

abstract class LeaveStates{}

class LeaveInitialState extends LeaveStates{}
class LeaveLoadingState extends LeaveStates{}
class LeaveLoadedState extends LeaveStates{
  LeaveModel leaveModel;
  LeaveLoadedState({required this.leaveModel});
}
class LeaveErrorState extends LeaveStates{
  String errormsg;
  LeaveErrorState({required this.errormsg});
}