import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/utils/chatRoom.dart';
import 'package:chat_app_ui/home/utils/signout.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:chat_app_ui/home/widgets/conversationBox.dart';
import 'package:chat_app_ui/home/widgets/searchBar.dart';
import 'package:chat_app_ui/home/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: ListView(
            children: [
              Header(),
              SizedBox(
                height: 10,
              ),
              SearchBar(),
              SizedBox(
                height: 5,
              ),
              StreamBuilder(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      strokeWidth: 1,
                    );
                  }
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int i) {
                        return ConversationBox(
                          caption: snapshot.data!.docs[i]['email'],
                          txt: snapshot.data!.docs[i]['name'],
                          dp: snapshot.data!.docs[i]['profilePic'],

                          func: (){

                            var condition = false;
                            userData['chats'].map((e) {
                              if (e['id'] == snapshot.data!.docs[i]['userId']) {
                                condition = false;
                              } else {
                                condition = true;
                              }
                            });

                            if (snapshot.data!.docs[i]['userId'] !=
                                    userData['userId'] &&
                                condition) {
                              generateChatRoomId(
                                  snapshot.data!.docs[i]['userId']);
                            } else {
                              print('You cannot add your self');
                            }


                            


                          },
                          
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryText(
          'Add Friend',
          size: 30,
          fontWeight: FontWeight.w900,
        ),
        Row(children: [
          AddButton(),
          SizedBox(width: 3),
          PopupMenuButton(
              child: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: GestureDetector(
                          onTap: () {
                            signOut();
                            Navigator.pushNamed(context, '/AUTH');
                          },
                          child: Text("logout")),
                    ),
                    PopupMenuItem(
                      child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/Chatter');
                          },
                          child: Text("Second")),
                    )
                  ])
        ]),
      ],
    );
  }
}
