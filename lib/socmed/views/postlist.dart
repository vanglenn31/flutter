import 'package:flutter/material.dart';
import 'package:my_first_app/socmed/model/userdata.dart';
import 'package:my_first_app/socmed/views/profile.view.dart';
import '../model/userpost.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.userdata});

  final UserData userdata ;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,);

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget buttons(UserPost userpost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userpost.isLiked) ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userpost.isLiked = userpost.isLiked ? false : true;
          });
        },
        icon: const Icon(Icons.thumb_up),
        label: Text('Like'),
      ),

      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey,
        ),
        onPressed: () {},
        icon: const Icon(Icons.comment),
        label: Text('Comment'),
      ),

      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey,
        ),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: Text('Share'),
      ),
    ],
  );

  Widget postCount(UserPost userpost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userpost.numcommits} Comments'),
      const Text(''),
      const SizedBox(width: 20),
      Text('${userpost.numshare} Share')
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical:10),
    child: Container(
      height:350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postimg),
          fit: BoxFit.fill)
      ),
    ),
  );

  Widget postHeader(UserPost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('${userPost.time} .'),
          const Icon(Icons.people, size: 18,)
          ],)
        ],
      )
    ],
  );

  Widget showPost(UserPost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(children: [Text(userPost.postcontent, style: nametxtStyle,)],),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey,),),
      const SizedBox(height: 15,)
    ],
  );

 @override
Widget build(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: widget.userdata.userlist.length,
    itemBuilder: (context, index) {
      final userPost = widget.userdata.userlist[index];

      return InkWell(
        onTap: () {
          gotoPage(
            context,
            ProfileView(userpost: userPost),
          );
        },
        child: showPost(userPost),
      );
    },
  );
}
}