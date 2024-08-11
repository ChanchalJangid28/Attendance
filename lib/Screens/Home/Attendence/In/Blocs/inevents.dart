abstract class InEvents{}
class UserInEvents extends InEvents{
  String userid;
  DateTime createdat;
  UserInEvents({required this.createdat,required this.userid});
}