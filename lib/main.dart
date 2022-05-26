import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:oxford_dictionary/oxford_dictionary.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageText(),
    );
  }
}

