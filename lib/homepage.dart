import 'package:flutter/material.dart';
import 'package:oxford_dictionary/oxford_dictionary.dart';
import 'package:words_game/random_letters.dart';
import "dart:math"; //package to generate random items
import 'gamelogic.dart';
import 'wordlist.dart';
import 'text_ouptput.dart';
import 'correct.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:oxford_dictionary/oxford_dictionary.dart';

class HomePageText extends StatefulWidget {
  @override
  _HomePageText createState() => _HomePageText();
}

var list = [
  'a',
  'b',
  'c',
  'e',
  'h',
  'm',
  'o',
  'p',
  't',
  'k',
  'i',
  'r',
  's',
  'n',
  'd',
  'u'
];
var wordlist = [
  'apple',
  'pear',
  'zebra',
  'balalaika',
  'kekandi',
  'aquickbrownfoxjumpsoverthelazydog',
  'abcdefghijklmonpqrstuvwxyz',
  'zyxwvutsrqpnomlkjihgfedcba',
  'nkr',
  'san',
];

final _random = Random();

var n1 = list[_random.nextInt(list.length)];
var n2 = list[_random.nextInt(list.length)];
var n3 = list[_random.nextInt(list.length)];
var checkRegex = RegExp('^(.*)($n1)(.*)($n2)(.*)($n3)(.*)\$');
var points = 0;
String userInput = '';
bool check = false;
bool wordcheck = false;

//oxdord dictionary here

void pointscounter() {
  check ? points = points + 100 : points = points - 150;
}




class _HomePageText extends State<HomePageText> {
//use this controller to get what the user is typing
  final _textController = TextEditingController();

//store a variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'W O R D G A M E',
            style: TextStyle(
                color: Colors.teal[800],
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 4),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          EnglishLetters(),
          TextOutput(),
          CorrectPoints(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 60,
                width: 320,
                child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        hintText: 'What word would you suggest?',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _textController.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ))),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
//button
                  child: MaterialButton(
                      onPressed: () {
//update the text
                        setState(() {
                          userInput = _textController.text;
                          check = checkRegex.hasMatch(userInput);
                          wordcheck = wordlist.contains(userInput);
//update the variables

                          n1 = list[_random.nextInt(list.length)];
                          n2 = list[_random.nextInt(list.length)];
                          n3 = list[_random.nextInt(list.length)];
                          checkRegex =
                              RegExp('^(.*)($n1)(.*)($n2)(.*)($n3)(.*)\$');
                          pointscounter();
                          // oxford();
                          _textController.clear();
                        });
                      },
                      color: Colors.teal,
                      child: Text(
                        'Try',
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
