
import 'package:flutter/material.dart';
import 'package:my_first_app/lab%202/intro.dart';
import 'package:my_first_app/lab%202/page1.dart';
import 'package:my_first_app/lab%202/page2.dart';
import 'package:my_first_app/strawberry%20pavlova/pavlova.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Pavlova(),
    );
  }


}

