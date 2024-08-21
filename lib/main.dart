import 'package:ayzapp_music/home_page.dart';
import 'package:ayzapp_music/player_page.dart';
import 'package:ayzapp_music/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: '/',
    debugShowCheckedModeBanner: false,
    getPages: [
       GetPage(name: '/', page: () => WelcomePage(),),
       GetPage(name: '/home', page: () => HomePage(),),
       GetPage(name: '/play', page: () => PlayPage(),),
    ],);
  }
}