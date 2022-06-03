import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:oxford_dictionary/oxford_dictionary.dart';

import 'homepage.dart';

void oxford() {
  find(userInput).then((word) {});
}

Future<Word?> find(String wordString, [http.Client? client]) async {
  final dictionary = OxfordDictionary(
    'en',
    Platform.environment['APP_ID'] ?? 'test_app_id',
    Platform.environment['APP_KEY'] ?? 'test_app_key',
    client: client,
  );

  // get word definition entry
  final word =
  await dictionary.entries.search(wordString).then((value) => value!);

  print(word);
  return word;
}

class Oxford extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text('word', //сюда нужно передать переменную word, которую возвращает словарь
      style: TextStyle(fontSize: 60, color: Colors.teal),
    );
  }
}

