import 'package:flutter/material.dart';

class Edgeinsets extends StatelessWidget {
  const Edgeinsets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EdgeInsets'),
      ),
      body:
         Column(
        crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
              color: Colors.grey[300],
              child: Container(
                color: Colors.red,
                padding: const EdgeInsets.all(30),
                child: const Text(
                  'EdgeInsets.all(30)'),
              )
            ),

            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              color: Colors.grey[300],
              child: Container(
                color: Colors.yellow,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: const Text(
                  'EdgeInsets.symmetric(horizontal: 40, vertical: 10)'),
              )
            ),

            const SizedBox(height: 30),
            Container(
              color: Colors.grey[300],
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20),
                child: const Text(
                  'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
                  style: TextStyle(color: Colors.white, fontSize: 12)
                ),
              )
            ),
            
            const SizedBox(height: 30),
            Container(
              color: Colors.grey[300],
              child:Container(
                padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
                color: Colors.green,
                child: Text('EdgeInsets, from LTRB(10, 20, 30, 40)',
                style: TextStyle(color: Colors.white)
                ),
              )
            )
           ],
         ),

  
    );
  }
}