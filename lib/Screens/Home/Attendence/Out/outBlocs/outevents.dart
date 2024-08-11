abstract class OutEvents{}
class UserOutEvents extends OutEvents{
  String userid;
  DateTime createdat;
  UserOutEvents({required this.createdat,required this.userid});
}

