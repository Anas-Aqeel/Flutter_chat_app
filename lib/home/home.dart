import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/Auth/pages/login/login.dart';
import 'package:chat_app_ui/home/pages/Friends.dart';
import 'package:chat_app_ui/home/pages/Profile.dart';
import 'package:chat_app_ui/home/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hexcolor/hexcolor.dart';

bool platform = kIsWeb;
Color primaryColor = HexColor('#0a0a0a');
Color accentColor = HexColor('#001433');

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/CHATS': (context) {
          return isAuthenticated ? MyChatScreen() : Login();
        },
        '/AUTH': (context) {
          return isAuthenticated ? Authenticator() : Login();
        },
        '/FRIENDS': (context) {
          return isAuthenticated ? Friends() : Login();
        },
        '/PROFILE': (context) {
          return isAuthenticated ? Profile() : Login();
        },
        '/GROUPS': (context) {
          return isAuthenticated ? Profile() : Login();
        },
        '/SETTINGS': (context) {
          return isAuthenticated ? Profile() : Login();
        },
        '/LOGIN': (context) => Login(),
      },
      home: MyChatScreen(),
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: accentColor),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
