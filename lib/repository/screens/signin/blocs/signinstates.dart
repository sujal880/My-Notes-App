import 'package:mynotes_app/domain/models/signinmodel.dart';

abstract class SignInStates {}

class SignInInitialStates extends SignInStates {}

class SignInLoadingStates extends SignInStates {}

class SignInLoadedStates extends SignInStates {
  SignInModel signInModel;
  SignInLoadedStates({required this.signInModel});
}

class SignInErrorStates extends SignInStates {
  String error;
  SignInErrorStates({required this.error});
}
