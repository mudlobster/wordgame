import 'package:flutter/material.dart';
import 'homepage.dart';

class EnglishLetters extends StatelessWidget {

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.teal[400],
          child: Center(
              child: Text(
                n1,
                style: TextStyle(fontSize: 80, color: Colors.white),
              ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.teal[400],
          child: Center(
            child: Text(
              n2,
              style: TextStyle(fontSize: 80, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.teal[400],
          child: Center(
            child: Text(
              n3,
              style: TextStyle(fontSize: 80, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

