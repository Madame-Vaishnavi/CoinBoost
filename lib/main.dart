import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship/GameScreen.dart';
import 'package:internship/onBoarding_screen.dart';
import 'package:internship/splash_screen.dart';

import 'bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.robotoMonoTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/splash" : (context)=> SplashScreen(),
        "/onboard" : (context)=> Onboarding(),
        "/home" : (context)=> BottomNav(),
        "/news" : (context) => Gamescreen(),
      },
    );
  }
}
