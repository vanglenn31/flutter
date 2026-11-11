import 'package:flutter/material.dart';
import 'package:my_first_app/socmed/views/friendlist.dart';
import 'package:my_first_app/socmed/views/infoheader.dart';
import 'package:my_first_app/socmed/views/mainheader.dart';
import 'package:my_first_app/socmed/model/userdata.dart';
import 'package:my_first_app/socmed/views/postlist.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  UserData userdata = UserData();

  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          MainHeader(userdata: userdata),
          Infoheader(userdata: userdata),
          Friendlist(userdata: userdata),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(children: [Text('Post', style: followTxtStyle,)],),
          ),
          const SizedBox(height: 20,),
          PostList(userdata: userdata),
        ],
      ),
    );
  }
}