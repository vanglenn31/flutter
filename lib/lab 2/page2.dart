import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body:
      Center(
        child: Column(
          children: [
              Image.asset(
                'assets/male1.jpg',
                height: 200,
                width: 200,
                
              ),
              Image.asset(
                'assets/female.jpg',
                height: 200,
                width: 200,
              ),
              Image.asset(
                'assets/male2.jpg',
                height: 200,
                width: 200,
              ),
            ],
        ),
      ),
    );
  }
}