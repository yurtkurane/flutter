import 'package:flutter/material.dart';
import 'package:introapp/swiper_screen.dart';
import 'package:introapp/result_screen.dart';



void main() {
  runApp(MaterialApp(
    home: SwiperScreen(),
   initialRoute: '/home',
    routes: {
      '/home': (context) => SwiperScreen(),
      '/result': (context) => ResultScreen(),
    },
  
  ));
}

