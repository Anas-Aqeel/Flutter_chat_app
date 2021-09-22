import 'package:chat_app_ui/Auth/pages/login/login.dart';
import 'package:chat_app_ui/Auth/pages/signup/signup.dart';
import 'package:chat_app_ui/home/home.dart';
import 'package:flutter/material.dart';

class MaterialAuth extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDivider(),
      routes: {
        '/LOGIN': (context) => Login(),
        '/SIGNUP': (context) => Signup(),
        '/HOME': (context) => Home()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.textsms,
              size: 120,
              color: Colors.deepPurple[900],
            ),
            SizedBox(height: 10),
            Text('FireChat',
                style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontSize: 27,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            Text('WORLD MOST PRIVATE CHATTING APP',
                style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 140),
            MyButton(
                txt: 'LOGIN',
                txtColor: Colors.deepPurple,
                bgColor: Colors.white),
            SizedBox(height: 10),
            MyButton(
                txt: 'SIGNUP',
                txtColor: Colors.white,
                bgColor: Colors.deepPurple.shade600),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final txt;
  final txtColor;
  final bgColor;
  MyButton({this.txt, this.bgColor, this.txtColor});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: bgColor,
      onPressed: () {
        print('/$txt');
        Navigator.pushNamed(context, '/$txt');
      },
      child: Text('$txt', style: TextStyle(color: txtColor, fontSize: 15)),
      minWidth: 260,
      height: 50,
      shape:
          StadiumBorder(side: BorderSide(width: 1, color: Colors.deepPurple)),
    );
  }
}
