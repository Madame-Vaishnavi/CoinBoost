import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

final TextEditingController _controller = new TextEditingController();

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // Ensures screen moves up when keyboard appears
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(), // Prevents unnecessary bouncing
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/LOGO.png"),
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(height: 50),
                  const Image(
                    image: AssetImage("assets/savings.png"),
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 50),

                  // TextField & Button Section
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    width: 307,
                    height: 48,
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Mobile Number",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.2),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){Navigator.pushReplacementNamed(context, "/home");},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7931A),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      width: 307,
                      height: 48,
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
