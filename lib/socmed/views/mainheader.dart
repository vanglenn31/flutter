import 'package:flutter/material.dart';
import '../model/userdata.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key, required this.userdata});

  final UserData userdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(userdata.myAccount.img),
        ),
        const SizedBox(height: 10),
        Text(
          userdata.myAccount.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),  
        ),
        Text(userdata.myAccount.email),
        const SizedBox(height: 20),
      ],
    );
  }
}