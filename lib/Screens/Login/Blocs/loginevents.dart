abstract class LogInEvents{
}
class LogInUserEvents extends LogInEvents{
  String email;
  String password;
  LogInUserEvents({required this.email,required this.password});
}