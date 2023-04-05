import 'package:bootcamp_ass1/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/login_page.dart';
//import 'pages/home.dart';
import 'screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        //brightness: Brightness.light,
        brightness: Brightness.dark,
      ),
      home: Scaffold(body: SignUp()),
      //home: Scaffold(body: LoginPage()),
    );
  }
}
