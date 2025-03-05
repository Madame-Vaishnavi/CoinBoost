import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    Future.delayed(Duration(seconds: 2),(){if(mounted){Navigator.pushReplacementNamed(context,"/onboard");}});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/LOGO.png"))
        ),
      ),
    );
  }
}
