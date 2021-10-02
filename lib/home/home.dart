import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/pages/ChatScreen.dart';
import 'package:chat_app_ui/home/pages/Friends.dart';
import 'package:chat_app_ui/home/pages/Profile.dart';
import 'package:chat_app_ui/home/pages/Home.dart';
import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/CHATS' : (context)=> MyChatScreen(),
        '/AUTH' : (context)=> Authenticator(),
        '/FRIENDS': (context)=> Friends(),
        '/PROFILE': (context)=> Profile(),
        '/Chatter': (context)=> Chatter(),
      },
      home: MyChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}