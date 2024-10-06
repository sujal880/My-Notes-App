abstract class SignInEvents {}

class SignInUserEvents extends SignInEvents {
  String email;
  String password;
  SignInUserEvents({required this.email, required this.password});
}
