import 'package:flutter/material.dart';
import 'package:oxford_dictionary/oxford_dictionary.dart';
import "dart:math"; //package to generate random items
import 'gamelogic.dart';
import 'wordlist.dart';


class HomePageText extends StatefulWidget {
  @override
  _HomePageText createState() => _HomePageText();
}

var list = ['a','b','c','e','h','m','o','p','t','k','i','r','s','n','d','u'];
var wordlist = [
  'apple',
  'pear',
  'zebra',
  'balalaika',
  'kekandi',
  'aquickbrownfoxjumpsoverthelazydog',
  'nkr',
  'san',
];



final _random = new Random();

var n1 = list[_random.nextInt(list.length)];
var n2 = list[_random.nextInt(list.length)];
var n3 = list[_random.nextInt(list.length)];

var check_regex = RegExp('^(.*)($n1)(.*)($n2)(.*)($n3)(.*)\$');

//oxdord dictionary here

class _HomePageText extends State<HomePageText>{
//use this controller to get what the user is typing
  final _textController = TextEditingController();
//store a variable

  String userInput = '';
  bool check = false;
  bool wordcheck = false;

  void pointscounter(){
    check ? points = points + 100 : points = points - 150;
  }

  var points = 0;

      @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //letters are here
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(height: 100, width: 100, color: Colors.teal[400], child: Center(child: Text(n1, style: TextStyle(fontSize: 80, color: Colors.white),)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(height: 100, width: 100, color: Colors.teal[400], child: Center(child: Text(n2, style: TextStyle(fontSize: 80, color: Colors.white),)),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(height: 100, width: 100, color: Colors.teal[400], child: Center(child: Text(n3, style: TextStyle(fontSize: 80, color: Colors.white),)),),
                    ),
                  ],
                ),
              ),
              //display text
              Expanded(child: Container(
                child: Center(
                  child: Text(userInput, style: TextStyle(fontSize: 80, color: Colors.teal),),
                ),
              ),
              ),
              //text input
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: check ? Text('correct', style:TextStyle(fontSize: 35, color: Colors.greenAccent[400])) : Text('wrong',style:TextStyle(fontSize: 35, color: Colors.redAccent)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: wordcheck ? Text('exists', style:TextStyle(fontSize: 35, color: Colors.greenAccent[400])) : Text('absent',style:TextStyle(fontSize: 35, color: Colors.redAccent)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                    child: Text('points: $points', style: TextStyle(fontSize: 30, color: Colors.teal),)),
              ),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                    hintText: 'What word would you suggest?',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(onPressed: () {
                      _textController.clear();
                    },
                      icon: const Icon (Icons.clear),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                //button
                child: MaterialButton(
                  onPressed: () {
                    //update the text
                    setState(() {
                      userInput = _textController.text;
                      check = check_regex.hasMatch(userInput);
                      wordcheck = wordlist.contains(userInput);
                      //update the variables

                      n1 = list[_random.nextInt(list.length)];
                      n2 = list[_random.nextInt(list.length)];
                      n3 = list[_random.nextInt(list.length)];
                      check_regex = RegExp('^(.*)($n1)(.*)($n2)(.*)($n3)(.*)\$');

                      pointscounter();
                      _textController.clear();
                    });
                  },
                  color: Colors.teal,
                  child: Text('Try', style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
