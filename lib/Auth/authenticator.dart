import 'package:chat_app_ui/Auth/pages/login/loginUtils.dart';
import 'package:chat_app_ui/Auth/pages/saperator.dart';
import 'package:chat_app_ui/home/widgets/loader.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app_ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

    Color primaryColor = HexColor('#0a0a0a');
    Color accentColor = HexColor('#001433');


var isAuthenticated;
dynamic userData;

class Authenticator extends StatefulWidget {
  @override
  _AuthenticatorState createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  @override
  Widget build(BuildContext context) {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          if (isAuthenticated != false) {
            setState(() {
              isAuthenticated = false;
              userData = null;
            });
          }
        } else {
          if (isAuthenticated != true) {
            
              getUserData(user.uid).then((value) =>{
                setState((){
                  userData=value;
                  isAuthenticated=true;
                })
              } );
              isAuthenticated = true;
            
          }
        }
      });
    } catch (e) {
      print(e);
    }

    if (isAuthenticated != null) {

      return MaterialApp(
        
         theme: ThemeData(
           fontFamily: 'Raleway',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: accentColor),
      ),
        title: 'Flutter Demo',
        routes: {
          '/Auth': (context) => MaterialAuth(),
          '/HOME': (context) => Home()
        },
        debugShowCheckedModeBanner: false,
        home: isAuthenticated ? Home() : MaterialAuth(),
      );
    } else {
      return Scaffold(
        body: Center(
          child: MyLoader(),
        ),
      );
    }
  }
}
