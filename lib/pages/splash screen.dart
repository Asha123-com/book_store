import 'dart:async';
import 'package:book_store/pages/Registation.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
          () =>
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Registration()),
                (route) => false,
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Image.asset('assets/image/logo of book.png'),
      ),
    );
  }
}