import 'package:flutter/material.dart';
import '../model/friend.dart';
import '../model/userdata.dart';

class Friendlist extends StatelessWidget {
   Friendlist({super.key, required this.userdata});

   final UserData userdata ;

   var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    child: Column(
      children: [
        Expanded(child: Image.asset(friend.img, width: double.infinity, fit: BoxFit.fill),),
        Padding(padding: const EdgeInsets.all(5),child: Text(friend.name),),
      ],
    ),
  ); 

  Widget friendListGrid() => GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      ),
    itemCount: userdata.friendlist.length,
    itemBuilder: (BuildContext ctx, index) {
      return friend(userdata.friendlist[index]);
    },
  );

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(children: [Text('Friends', style: followTxtStyle,),],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [Text('${userdata.friendlist.length} Friends', ),],),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 280,
          child: friendListGrid(),
        ),
        SizedBox(height: 2, child: Container(color: Colors.grey,),),
      ],
    );
  }
}