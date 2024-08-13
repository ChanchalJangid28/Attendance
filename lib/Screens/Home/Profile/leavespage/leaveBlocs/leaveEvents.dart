abstract class LeaveEvents{}
class UserLeaveEvents extends LeaveEvents{
  String userid;
  DateTime createdat;
  UserLeaveEvents({required this.createdat,required this.userid});
}