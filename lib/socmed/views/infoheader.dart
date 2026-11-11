import 'package:flutter/material.dart';
import '../model/userdata.dart';

class Infoheader extends StatelessWidget {
   Infoheader({super.key, required this.userdata});
  final UserData userdata;

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Followers'), Text('Following'), Text('Posts'),
          ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(userdata.myAccount.numFollowers.toString(), style: followTxtStyle,),
              Text(userdata.myAccount.numFollowing.toString(), style: followTxtStyle,),
              Text(userdata.myAccount.numPosts.toString(), style: followTxtStyle,),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey),
      ],
    );
  }
}