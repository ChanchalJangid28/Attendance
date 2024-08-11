abstract class ProfileEvents{}
class UserProfileEvents extends ProfileEvents{
  String userid;
  UserProfileEvents({required this.userid});
}