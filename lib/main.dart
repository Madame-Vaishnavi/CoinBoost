import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:internship/news_screen.dart';
import 'package:internship/news_task.dart';
import 'package:internship/onBoarding_screen.dart';
import 'package:internship/splash_screen.dart';

import 'bottom_nav.dart';

void main() async {
  var devices=["0FE7F9D0F4280CBD300A87E36DAFE146"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration= RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
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
        "/news" : (context) => NewsScreen(),
        "/newsTask" : (context)=> NewsTask(),
      },
    );
  }
}
