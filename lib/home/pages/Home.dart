import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/pages/dashChat.dart';
import 'package:chat_app_ui/home/utils/signout.dart';
import 'package:chat_app_ui/home/widgets/ChatListViewItem.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
// import 'package:chat_app_ui/home/widgets/conversationBox.dart';
import 'package:chat_app_ui/home/widgets/drawer.dart';
import 'package:chat_app_ui/home/widgets/header_widget.dart';
import 'package:chat_app_ui/home/widgets/searchBar.dart';
import 'package:chat_app_ui/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyChatScreen extends StatefulWidget {
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
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
            
            // SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              padding: EdgeInsets.only( left: 20, right: 20),
              child: Column(
                children: [

                  SearchBar(),
                  SizedBox(
                    height: 5,
                  ),
                  userData == null
                      ? Center(
                          child: SpinKitCircle(
                            itemBuilder: (_, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: index.isEven
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              );
                            },
                            size: 120.0,
                          ),
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userData['chats'].length,
                          itemBuilder: (BuildContext context, int i) {
                            return ChatListViewItem(
                              lastMessage: userData['chats'][i]
                                  ['chatterEmail'],
                              name: userData['chats'][i]['chatterName'],
                              image: userData['chats'][i]['chatterDp'],
                              function: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyDashChat(
                                              userData['chats'][i]
                                                  ['chatRoomId'],
                                              userData['chats'][i]['id'],
                                              userData['chats'][i]
                                                  ['chatterName'],
                                            )));
                              },
                              hasUnreadMessage: true,
                              newMesssageCount: 2,
                              time: Text('19:32'),
                            );
                          }),
                ],
              ),
            ),
            ]),
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
      padding: EdgeInsets.only(top: 10, left:20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            'Conversations',
            size: 23,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
          Row(children: [
            AddButton(),
            SizedBox(width: 3),
            PopupMenuButton(
                child: Icon(Icons.more_vert, color: Colors.white),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          Navigator.pushNamed(context, '/PROFILE');
                        },
                        child: Text("profile"),
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
