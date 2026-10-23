import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body:
      Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 90,
                  width: 90,
                  color: Colors.blue,
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.green,
                ), 
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.yellow,
                ),
                Container(
                  height: 60,
                  width: 60,
                  color: Colors.black,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}