import 'package:flutter/material.dart';
import 'package:flutter_project/pages/homePage.dart';
import 'package:flutter_project/pages/startPage.dart';

void main() {
  runApp(const MYApp());
} //void main

class MYApp extends StatelessWidget {
  const MYApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const startPage(),
    );
  }
}

