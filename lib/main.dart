import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ql_giay/Screen/Home.dart';
import 'package:ql_giay/Screen/Sign%20In.dart';

import 'Screen/Sign Up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignIn(),
      initialRoute: '/',
      routes: {
        '/home' : (context) => const HomePage(),
        '/signIn' : (context) => const SignIn(),
        '/signUp' : (context) => const SignUp(),
      },
    );
  }
}


