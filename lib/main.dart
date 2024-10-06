import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes_app/data/remote/apihelper.dart';
import 'package:mynotes_app/repository/screens/home/addnotes/blocs/addnotebloc.dart';
import 'package:mynotes_app/repository/screens/home/fetchnotes/cubit/fetchnotescubit.dart';
import 'package:mynotes_app/repository/screens/signin/blocs/signinbloc.dart';
import 'package:mynotes_app/repository/screens/signup/blocs/signupbloc.dart';
import 'package:mynotes_app/repository/screens/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SignUpBloc(apiHelper: ApiHelper())),
          BlocProvider(create: (_) => SignInBloc(apiHelper: ApiHelper())),
          BlocProvider(create: (_) => AddNoteBloc(apiHelper: ApiHelper())),
          BlocProvider(
              create: (_) =>
                  FetchNotesCubit(apiHelper: ApiHelper())..fetchNotes())
        ],
        child: MaterialApp(
            title: 'My Notes App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: const Color(0XFF213BC5)),
                useMaterial3: false,
                fontFamily: "Regular"),
            home: SplashScreen()),
      ),
    );
  }
}
