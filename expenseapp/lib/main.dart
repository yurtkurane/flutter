import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 59, 18, 222),
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 77, 32, 255),
  secondary: Color.fromARGB(255, 191, 175, 255),
  background: Colors.white,
  error: Colors.red,

  );



void main() {
  runApp(MaterialApp(

      theme: ThemeData(
         useMaterial3: true, 
         colorScheme: colorScheme1, 
         cardTheme: CardTheme(color: colorScheme1.inversePrimary,margin: const EdgeInsets.all(5)),
         fontFamily: 'Helvetica',
         textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: const TextStyle(fontWeight: FontWeight.normal)),
        ), 


      home: const MainPage()
      )
    );
}


// Color.fromARGB(255, 59, 18, 222)