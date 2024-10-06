import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/data/remote/baseurls.dart';
import 'package:mynotes_app/domain/constants/appprefs.dart';
import 'package:mynotes_app/domain/models/signinmodel.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinevents.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinstates.dart';
import '../../../../data/remote/apihelper.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  ApiHelper apiHelper;
  SignInBloc({required this.apiHelper}) : super(SignInInitialStates()) {
    on<SignInUserEvents>((event, emit) async {
      emit(SignInLoadingStates());
      try {
        final responsedata = await apiHelper.postapi(
            url: BaseUrls.signin,
            bodyparams: {"email": event.email, "password": event.password});
        final signinmodel = SignInModel.fromJson(responsedata);
        AppPrefs().setprefs(signinmodel.token.toString());
        AppPrefs().setBool(true);
        AppPrefs().setuserId(signinmodel.reponse!.sId.toString());
        emit(SignInLoadedStates(signInModel: signinmodel));
      } catch (ex) {
        emit(SignInErrorStates(error: ex.toString()));
      }
    });
  }
}
