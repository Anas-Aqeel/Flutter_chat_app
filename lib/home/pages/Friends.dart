import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/utils/chatRoom.dart';
import 'package:chat_app_ui/home/utils/signout.dart';
import 'package:chat_app_ui/home/widgets/ChatListViewItem.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:chat_app_ui/home/widgets/drawer.dart';
import 'package:chat_app_ui/home/widgets/header_widget.dart';
import 'package:chat_app_ui/home/widgets/loader.dart';
import 'package:chat_app_ui/home/widgets/searchBar.dart';
import 'package:chat_app_ui/home/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List data = [];

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 16,
            ),
            child: Icon(Icons.settings),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                 Container(
                height: 100,
                child: HeaderWidget(100, false, Icons.house_rounded),
              ),
                Header(),
                

                StreamBuilder(
                  stream: _usersStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return MyLoader();
                    }

                    data = snapshot.data!.docs;
                    return Container( 
                     margin: EdgeInsets.only(top: 40, bottom: 20),
                     padding: EdgeInsets.only( left: 20, right: 20),
                      child: Column(

                        children: [
                          SearchBar(),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int i) {
                                return ChatListViewItem(
                                  lastMessage: data[i]['email'],
                                  name:  data[i]['name'],
                                  image:  data[i]['profilePic'],
                                  time: Icon(Icons.forward),
                                  hasUnreadMessage: false,
                                  newMesssageCount: 2,
                                  function:  () {
                                    var condition = true;
                                    for (var e in userData['chats']) {
                                      print(e);
                                      if (e['id'] == data[i]['userId']) {
                                        setState(() {
                                          condition = false;
                                        });
                                        break;
                                      } else if (e['id'] != data[i]['userId']) {
                                        if (!condition) {
                                          setState(() {
                                            condition = true;
                                          });
                                          break;
                                        }
                                      }
                                    }

                                    if (data[i]['userId'] != userData['userId'] &&
                                        condition) {
                                      generateChatRoomId(
                                          snapshot.data!.docs[i]['userId']);
                                    } else {
                                      print('You cannot add your self');
                                    }
                                  },
                                );
                              }),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.only(top: 10, left:20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            'Add Friend',
            size: 23,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          Row(children: [
            AddButton(),
            SizedBox(width: 3),
            PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: GestureDetector(
                            onTap: () {
                              signOut();
                              Navigator.pushNamed(context, '/PROFILE');
                            },
                            child: Text("Profile")),
                      ),
                      PopupMenuItem(
                        child: GestureDetector(
                            onTap: () {
                              signOut();
                              Navigator.pushNamed(context, '/AUTH');
                            },
                            child: Text("logout")),
                      ),
                    ])
          ]),
        ],
      ),
    );
  }
}
