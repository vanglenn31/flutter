import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My First Flutter App'),
      ),
      body: Center(
        child: Text(
          'Hello, Ivan Glenn Entrina',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
    
  }
}