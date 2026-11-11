import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: act5()));
}

class act5 extends StatelessWidget {
  const act5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TASK 5 - MACAPUNDAG')),
      body: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height:200),
            Text('MainAxisAlignment.center'),
        Container(
           child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.yellow, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
                        
              ],
            ),
            ),
            SizedBox(height: 450),

            Text('MainAxisAlignment.spaceAround'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.yellow, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
            SizedBox(height: 450),

            Text('MainAxisAlignment.spaceBetween'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.yellow, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
            SizedBox(height: 450),

            Text('MainAxisAlignment.spaceEvenly'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.yellow, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
            SizedBox(height: 450),

            Text('MainAxisAlignment.start'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.yellow, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
            SizedBox(height: 450),

            Text('MainAxisAlignment.end'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(color: Colors.red, width: 50, height: 50),
                Container(color: Colors.yellow, width: 50, height: 50),
                Container(color: Colors.blue, width: 50, height: 50),
              ],
            ),
            SizedBox(height: 450),

            // ---------- CrossAxisAlignment (Column) ----------
            Text('CrossAxisAlignment.start'),
            Container(
              width: 300,
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Colors.red, width: 50, height: 50),
                  Container(color: Colors.yellow, width: 50, height: 50),
                  Container(color: Colors.blue, width: 50, height: 50),
                ],
              ),
            ),
            SizedBox(height: 450),

            Text('CrossAxisAlignment.center'),
            Container(
              width: 300,
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(color: Colors.red, width: 50, height: 50),
                  Container(color: Colors.yellow, width: 50, height: 50),
                  Container(color: Colors.blue, width: 50, height: 50),
                ],
              ),
            ),
            SizedBox(height: 450),

            Text('CrossAxisAlignment.end'),
            Container(
              width: 300,
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(color: Colors.red, width: 50, height: 50),
                  Container(color: Colors.yellow, width: 50, height: 50),
                  Container(color: Colors.blue, width: 50, height: 50),
                ],
              ),
            ),
            SizedBox(height: 450),

            Text('CrossAxisAlignment.stretch'),
            Container(
              width: 300,
              color: Colors.grey[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(color: Colors.red, height: 50),
                  Container(color: Colors.yellow, height: 50),
                  Container(color: Colors.blue, height: 50),
                ],
              ),
            ),
            SizedBox(height: 450),
          ],
        ),
      ),
    );
  }
}