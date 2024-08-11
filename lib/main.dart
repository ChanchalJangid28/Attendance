import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileBlocs/profilebloc.dart';
import 'package:attendence_app/Screens/Login/Blocs/loginbloc.dart';
import 'package:attendence_app/Screens/Signup/Blocs/signupblocs.dart';
import 'package:attendence_app/Screens/Splash/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/Home/Attendence/In/Blocs/inbloc.dart';
import 'Screens/Home/Attendence/Out/outBlocs/outbloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'key',
        appId: 'id',
        messagingSenderId: 'sendid',
        projectId: 'myapp',
        storageBucket: 'myapp-b9yt18.appspot.com',
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>SignUpBloc()),
        BlocProvider(create: (_)=>LoginBloc()),
        BlocProvider(create: (_)=>InBloc()),
        BlocProvider(create: (_)=>OutBloc()),
        BlocProvider(create: (_)=>ProfileBloc())
      ],
      child: MaterialApp(
        title: 'Attendance App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        home: Splashscreen()
      ),
    );
  }
}