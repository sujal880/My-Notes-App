import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinbloc.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinevents.dart';
import 'package:mynotes_app/repository/widgets/uihelper.dart';

class SignInController {
  static signIn(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (email == "" || password == "") {
      return UiHelper.CustomSnackBar(context, "Enter Required Field's");
    } else {
      BlocProvider.of<SignInBloc>(context)
          .add(SignInUserEvents(email: email, password: password));
    }
  }
}
