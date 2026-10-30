import 'package:flutter/material.dart';

class AxisAligment extends StatelessWidget {
  const AxisAligment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 5 - Entrina'),
      ),
      body: Column(
        children: [
          const Text(
            'Column - crossAxisAlignment.stretch',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Center(
              child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 90,
                      width: 90,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 80,
                      height: 80,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
              
            ),
          ),
        ],
      ),
    );
  }
}