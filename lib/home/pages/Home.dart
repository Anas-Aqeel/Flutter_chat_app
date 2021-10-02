import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/pages/ChatScreen.dart';
import 'package:chat_app_ui/home/utils/signout.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:chat_app_ui/home/widgets/conversationBox.dart';
import 'package:chat_app_ui/home/widgets/searchBar.dart';
import 'package:chat_app_ui/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyChatScreen extends StatefulWidget {
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  var itemCount = userData['chats'].length;
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
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int i) {
                    return ConversationBox(
                      caption: userData['chats'][i]['email'],
                      txt: userData['chats'][i]['name'],
                      dp: userData['chats'][i]['profilePic'],
                      func: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Chatter(chatterId: userData['chats'][i]['userId'],)));
                      },
                    );
                  }),
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
          'Conversations',
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
                      child: Text("Second"),
                    )
                  ])
        ]),
      ],
    );
  }
}
