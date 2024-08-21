import 'package:book_store/class/class.dart';
import 'package:book_store/pages/Nagivation.dart';
import 'package:book_store/pages/Registation.dart';
import 'package:book_store/pages/buy%20page.dart';
import 'package:book_store/pages/favorite.dart';
import 'package:book_store/pages/homepage.dart';
import 'package:book_store/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash screen.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ManageState()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}