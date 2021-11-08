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
       theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: accentColor),
      ),
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

              color: primaryColor,
            ),
            
            SizedBox(height: 10),
            Text('FireChat',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            Text('WORLD MOST PRIVATE CHATTING APP',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 140),
            MyButton(
                txt: 'LOGIN',
                txtColor: accentColor,
                bgColor: Colors.white),
            SizedBox(height: 10),
            MyButton(
                txt: 'SIGNUP',
                txtColor: Colors.white,
                bgColor: accentColor),
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
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: txtColor),
                      borderRadius: BorderRadius.circular(4),
                        ),
      onPressed: () {
        print('/$txt');
        Navigator.pushNamed(context, '/$txt');
      },
      child: Text('$txt', style: TextStyle(color: txtColor, fontSize: 15)),
      minWidth: 260,
      height: 50,
      
    );
  }
}
