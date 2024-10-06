import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupbloc.dart';
import 'package:mynotes_app/repository/widgets/uihelper.dart';

import '../blocs/signupevents.dart';

class SignUpController {
  signupController(
      {required String email,
      required String password,
      required String username,
      required BuildContext context}) {
    if (email == "" || password == "" || username == "") {
      return UiHelper.CustomSnackBar(context, "Enter Required Field's");
    } else {
      BlocProvider.of<SignUpBloc>(context).add(SignUpUserEvents(
          email: email, password: password, username: username));
    }
  }
}
