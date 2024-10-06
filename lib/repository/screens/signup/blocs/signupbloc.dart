import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes_app/data/remote/apihelper.dart';
import 'package:mynotes_app/data/remote/baseurls.dart';
import 'package:mynotes_app/domain/models/sigupmodel.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupevents.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupstates.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  ApiHelper apiHelper;
  SignUpBloc({required this.apiHelper}) : super(SignUpInitialStates()) {
    on<SignUpUserEvents>((event, emit) async {
      emit(SignUpLoadingStates());
      try {
        final responsedata = await apiHelper.postapi(
            url: BaseUrls.signup,
            bodyparams: {
              "email": event.email,
              "password": event.password,
              "username": event.username
            });
        final signupmodel = SignUpModel.fromJson(responsedata);
        emit(SignUpLoadedStates(signUpModel: signupmodel));
      } catch (ex) {
        emit(SignUpErrorStates(errormsg: ex.toString()));
      }
    });
  }
}
