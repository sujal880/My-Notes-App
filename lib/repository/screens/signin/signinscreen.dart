import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes_app/repository/screens/home/homescreen.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinbloc.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinstates.dart';
import 'package:mynotes_app/repository/screens/signin/controllers/signincontroller.dart';
import 'package:mynotes_app/repository/screens/signup/signupscreen.dart';
import 'package:mynotes_app/repository/widgets/uihelper.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomText(
                text: "Login here",
                fontsize: 25.sp,
                fontfamily: "Bold",
                color: Color(0XFF213BC5)),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomText(
                text: "Welcome back you’ve ",
                fontsize: 18.sp,
                fontfamily: "Bold"),
            UiHelper.CustomText(
                text: "been missed!", fontsize: 18.sp, fontfamily: "Bold"),
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
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UiHelper.CustomTextButton(
                      callback: () {}, text: "Forgot your password?")
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<SignInBloc, SignInStates>(
              listener: (context, state) {
                if (state is SignInLoadedStates) {
                  UiHelper.CustomSnackBar(
                      context, state.signInModel.message.toString());
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else if (state is SignInErrorStates) {
                  UiHelper.CustomSnackBar(context, state.error.toString());
                }
              },
              builder: (context, state) {
                if (state is SignInLoadingStates) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return UiHelper.CustomButton(
                    callback: () {
                      SignInController.signIn(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString(),
                          context: context);
                    },
                    text: "Sign In");
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomTextButton(
                callback: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                text: "create new account?",
                color: Color(0XFF000000))
          ],
        ),
      ),
    );
  }
}
