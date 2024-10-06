import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes_app/repository/screens/signin/signinscreen.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupbloc.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupevents.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupstates.dart';
import 'package:mynotes_app/repository/screens/signup/controllers/signupcontroller.dart';

import '../../widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomText(
                text: "Create Account",
                fontsize: 25.sp,
                fontfamily: "Bold",
                color: const Color(0XFF213BC5)),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomText(
                text: "create an account so you easily",
                fontsize: 18.sp,
                fontfamily: "Bold"),
            UiHelper.CustomText(
                text: "explore new Todo’s",
                fontsize: 18.sp,
                fontfamily: "Bold"),
            SizedBox(
              height: 30.h,
            ),
            UiHelper.CustomTextField(
                emailController, "Email", false, TextInputType.emailAddress),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomTextField(passwordController, "Password", true,
                TextInputType.visiblePassword),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomTextField(
                usernameController, "Username", false, TextInputType.name),
            SizedBox(
              height: 40.h,
            ),
            BlocConsumer<SignUpBloc, SignUpStates>(
              listener: (context, state) {
                if (state is SignUpLoadedStates) {
                  UiHelper.CustomSnackBar(
                      context, state.signUpModel.message.toString());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                } else if (state is SignUpErrorStates) {
                  UiHelper.CustomSnackBar(context, state.errormsg.toString());
                }
              },
              builder: (context, state) {
                if (state is SignUpLoadingStates) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return UiHelper.CustomButton(
                    callback: () {
                      SignUpController().signupController(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                          username: usernameController.text.toString(),
                          context: context);
                    },
                    text: "Sign Up");
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomTextButton(
                callback: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                text: "already have an account?",
                color: const Color(0XFF000000))
          ],
        ),
      ),
    );
  }
}
