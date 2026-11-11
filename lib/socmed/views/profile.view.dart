
import 'package:flutter/material.dart';
import 'package:my_first_app/socmed/model/usercomment.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key, required this.userpost});

  final UserPost userpost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final UserData userdata = UserData();

  final TextEditingController commentController =
      TextEditingController();

  late List<Usercomment> comments;

  var nametxtStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  var boldtxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );

  var boldtxtStyle1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  @override
  void initState() {
    super.initState();

    // Make a local copy of the existing comments.
    comments = List<Usercomment>.from(userdata.commentlist);
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  // ADD COMMENT
  void addComment() {
    String content = commentController.text.trim();

    if (content.isEmpty) {
      return;
    }

    setState(() {
      comments.add(
        Usercomment(
          commenterImg: userdata.myAccount.img,
          commenterName: userdata.myAccount.name,
          commentTime: 'Just now',
          commentContent: content,
        ),
      );
    });

    commentController.clear();
    FocusScope.of(context).unfocus();
  }

  Widget commentBtn(Usercomment usercomment) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(usercomment.commentTime),
        const SizedBox(width: 15),
        const Text('Like'),
        const SizedBox(width: 15),
        const Text('Reply'),
      ],
    ),
  );

  Widget commentDesc(Usercomment usercomment) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          usercomment.commenterName,
          style: boldtxtStyle1,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Flexible(
              child: Text(usercomment.commentContent),
            ),
          ],
        ),
      ],
    ),
  );

  Widget commentSpace(Usercomment usercomment) => Container(
    constraints: const BoxConstraints(maxWidth: 260),
    decoration: const BoxDecoration(
      color: Color.fromARGB(35, 158, 158, 158),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: commentDesc(usercomment),
  );

  Widget commenterPic(Usercomment usercomment) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(usercomment.commenterImg),
    ),
  );

  Widget usercommenterline(
    UserPost userpost,
    Usercomment usercomment,
  ) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      commenterPic(usercomment),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commentSpace(usercomment),
            commentBtn(usercomment),
          ],
        ),
      ),
    ],
  );

  Widget userpostdetails(Usercomment usercomment) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(height: 15),
      usercommenterline(widget.userpost, usercomment),
    ],
  );

  Widget commenters(UserPost userpost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All Comments', style: boldtxtStyle),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    ],
  );

  Widget buttons(UserPost userpost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor:
                    userpost.isLiked ? Colors.grey : Colors.blue,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.thumb_up_alt_outlined,
                size: 20,
              ),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              onPressed: () {
                FocusScope.of(context).requestFocus(
                  FocusNode(),
                );
              },
              icon: const Icon(
                Icons.chat_bubble_outline,
                size: 20,
              ),
              label: const Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey,
              ),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    ],
  );

  Widget userline(UserPost userpost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userpost.userimg),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userpost.username, style: nametxtStyle),
          const SizedBox(width: 5),
          Row(
            children: [
              Text(userpost.time),
              const Text('.'),
              const Icon(
                Icons.group,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postimage(UserPost userpost) => Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(userpost.postcontent),
          ],
        ),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            userpost.postimg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );

  // COMMENT INPUT
  Widget commentInput() => Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userdata.myAccount.img),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Write a comment...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: addComment,
          icon: const Icon(
            Icons.send,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          userline(widget.userpost),
          postimage(widget.userpost),
          buttons(widget.userpost),
          commenters(widget.userpost),

          // DISPLAY COMMENTS
          ...comments.map(
            (usercomment) => userpostdetails(usercomment),
          ),

          // COMMENT INPUT
          commentInput(),
        ],
      ),
    );
  }
}
