abstract class SignUpEvents {}

class SignUpUserEvents extends SignUpEvents {
  String email;
  String password;
  String username;
  SignUpUserEvents(
      {required this.email, required this.password, required this.username});
}
