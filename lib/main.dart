import 'package:flutter/material.dart';
import 'package:untitled12/MyApps.dart';
import 'package:untitled12/PDF_Screen.dart';
import 'package:untitled12/Screen/festival_post/Second.dart';
import 'package:untitled12/Screen/festival_post/home_screen.dart';
import 'package:untitled12/Screen/festival_post/select_img_screen.dart';
import 'Screen/festival_post/edit_screen.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (contex) => MyApps(),
        'second': (contex) => Second(),
        'selectimg':(contex) => ImageScreen(),
        'editscreen':(contex) => EditScreen(),
      },
    ),
  );
}
