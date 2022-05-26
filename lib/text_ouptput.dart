import 'package:flutter/material.dart';
import 'homepage.dart';

class TextOutput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Text(userInput,
     style: TextStyle(fontSize: 60, color: Colors.teal),
   );
  }
}
