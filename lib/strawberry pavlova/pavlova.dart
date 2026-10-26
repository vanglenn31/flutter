import 'package:flutter/material.dart';

class Pavlova extends StatelessWidget {
  const Pavlova({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pavlova'),
      ),
      body: Center(
        child: ListView(
          children: [
            buildColumn(Image.asset('assets/pavlova/pavlovaPic.jpg')),
            buildRow(2, 90),
            const SizedBox(height: 10),
            buildRowTabs(),
          ],
        ),
        
      ),
      
    );
  }
  Widget buildColumn(Image image) => Column(
    children: [
      image,
      const SizedBox(height: 10),
      const Text(
        'Strawberry Pavlova',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(margin: const EdgeInsets.all(15),
        child: const Text(
          'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
          'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
          style: TextStyle(fontSize: 19),
          textAlign: TextAlign.justify,  
        ),
      ),
    ]);

    Widget buildRow(int rating, int numreviews) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       for (var i = 1; i <= rating; i++)
        const Icon(Icons.star,
        color: Colors.yellow,
        size: 24,
    ),
    for (var i = 1; i <= (5 - rating); i++)
        const Icon(Icons.star_border,
        color: Colors.yellow,
        size: 24,
       ),
       const SizedBox(width: 20),
       Text(
        '$numreviews Reviews',
        style: TextStyle(
          fontSize: 18),
       ),
      ],
    );

    Widget buildRowTabs() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildcontab(Icons.kitchen, 'PREP:', '25 min'),
        buildcontab(Icons.timer, 'COOK:', '1 hr'),
        buildcontab(Icons.restaurant, 'FEEDS:', '4-6'),
      ],
    );

    Widget buildcontab(IconData iconval, String title, String time) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconval, color: Colors.green,),
        SizedBox(height: 10),
        Text(title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(height: 10),
        Text(time,
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
}