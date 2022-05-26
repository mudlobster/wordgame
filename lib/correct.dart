import 'package:flutter/material.dart';
import 'homepage.dart';

class CorrectPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: check
            ? Text('correct',
            style: TextStyle(
                fontSize: 35, color: Colors.greenAccent[400]))
            : Text('wrong',
        style: TextStyle(fontSize: 35, color: Colors.redAccent),
          ),
        ),
        Text(
          'points: $points',
          style: TextStyle(fontSize: 30, color: Colors.teal),
        ),
      ],
    );
  }
}
