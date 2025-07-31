import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'Landing_Page.dart';



void main()
{
  runApp( MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.black,          // Primary color
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,          // Defines all shades
      ),),
    title: "Form",
    debugShowCheckedModeBanner: false,
    home: Landing_Page(),
  ));
}


