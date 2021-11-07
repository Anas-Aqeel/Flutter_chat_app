import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/pages/Friends.dart';
import 'package:chat_app_ui/home/pages/Profile.dart';
import 'package:chat_app_ui/home/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _primaryColor = HexColor('#0a0a0a');
    Color _accentColor = HexColor('#001433');
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/CHATS': (context) => MyChatScreen(),
        '/AUTH': (context) => Authenticator(),
        '/FRIENDS': (context) => Friends(),
        '/PROFILE': (context) => Profile(),
        '/GROUPS': (context) => Profile(),
        '/SETTINGS': (context) => Profile(),
      },
      home: MyChatScreen(),
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: _accentColor),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
