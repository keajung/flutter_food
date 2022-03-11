import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';
import 'package:flutter_food/pages/home/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'โบโบ้ GRAB FOOD 🐶',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade100,
      ),
      home:  HomePage(),
    );
  }
}

