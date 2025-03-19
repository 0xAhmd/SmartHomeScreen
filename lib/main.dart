import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homei/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.grey[200],
      ),

      home: const HomePage(),
    );
  }
}
