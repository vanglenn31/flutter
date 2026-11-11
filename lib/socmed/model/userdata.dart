import 'package:my_first_app/socmed/model/account.dart';

import 'friend.dart';

import 'userpost.dart';
import 'usercomment.dart';

class UserData {
  List<UserPost> userlist = [
    UserPost(
      userimg: 'assets/soc_med/lady1.jpg',
      username: 'Lily',
      time: '2h',
      postcontent: 'Pavlova!',
      postimg: 'assets/pavlova/pavlovaPic.jpg',
      numcommits: '10',
      numshare: '5',
      isLiked: false,
    ),

    UserPost(
      userimg: 'assets/soc_med/lady2.jpg',
      username: 'Rose',
      time: '3h',
      postcontent: 'I love this!',
      postimg: 'assets/soc_med/adobo.jpg',
      numcommits: '8',
      numshare: '3',
      isLiked: true,
    ),

    UserPost(
      userimg: 'assets/soc_med/lady3.jpg',
      username: 'Daisy',
      time: '5h',
      postcontent: 'This is amazing!',
      postimg: 'assets/soc_med/roast_chicken.jpg',
      numcommits: '15',
      numshare: '7',
      isLiked: false,
    ),

    UserPost(
      userimg: 'assets/soc_med/man1.jpg',
      username: 'Jhon',
      time: '1d',
      postcontent: 'Mad Max!',
      postimg: 'assets/soc_med/F1.jpg',
      numcommits: '12',
      numshare: '4',
      isLiked: true,
    ),
  ];

  List<Friend> friendlist = [
    Friend(
      img: 'assets/soc_med/lady1.jpg',
      name: 'Lily',
    ),
    Friend(
      img: 'assets/soc_med/lady2.jpg',
      name: 'Rose',
    ),
    Friend(
      img: 'assets/soc_med/lady3.jpg',
      name: 'Daisy',
    ),
    Friend(
      img: 'assets/soc_med/man1.jpg',
      name: 'Jhon',
    ),
    Friend(
      img: 'assets/soc_med/man2.jpg',
      name: 'Mike',
    ),
  ];

  List<Usercomment> commentlist = [
    Usercomment(
      commenterImg: 'assets/soc_med/lady1.jpg',
      commenterName: 'Lily',
      commentTime: '2h',
      commentContent: 'Pavlova!',
    ),

    Usercomment(
      commenterImg: 'assets/soc_med/lady2.jpg',
      commenterName: 'Rose',
      commentTime: '3h',
      commentContent: 'I love this!',
    ),
    Usercomment(
      commenterImg: 'assets/soc_med/lady3.jpg',
      commenterName: 'Daisy',
      commentTime: '5h',
      commentContent: 'This is amazing!',
    ),

    Usercomment(
      commenterImg: 'assets/soc_med/man1.jpg',
      commenterName: 'Jhon',
      commentTime: '1d',
      commentContent: 'Mad Max!',
    ),
  ];

  Account myAccount = Account(
    name: 'Ivan Glenn M. Entrina',
    email: 'ivan.entrina@gmail.com',
    img: 'assets/soc_med/ivan.jpg',
    numFollowers: '100',
    numPosts: '50',
    numFollowing: '75',
    numFriends: '25',
  );
}