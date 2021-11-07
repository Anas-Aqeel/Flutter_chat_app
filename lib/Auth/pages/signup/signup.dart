// import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/Auth/pages/signup/signupUtils.dart';
import 'package:chat_app_ui/home/widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_ui/home/home.dart';


class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SingleChildScrollView(
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
                  SizedBox(height: 30),
                  MyInputField(
                    type: 'Name',
                    icon: Icons.text_format,
                    name: name,
                  ),
                  SizedBox(height: 20),
                  MyInputField(
                    type: 'Email',
                    icon: Icons.email,
                    name: email,
                  ),
                  SizedBox(height: 20),
                  MyInputField(
                    type: 'Password',
                    icon: Icons.lock,
                    name: password,
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    color: accentColor,
                    onPressed: () async {
                      String result = await register(name.text,email.text, password.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:  Text('$result'),)
                      );
                      if (result == 'Registered Successfully') {
                        Navigator.pushNamed(context, '/HOME');
                      }
                    },
                    child: Text('SIGNUP',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    minWidth: 260,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                        ),
                  ),
                  SizedBox(height: 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/LOGIN');
                    },
                    child: Text('or login instead',
                        style: TextStyle(
                            color: Colors.deepPurple[900],
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

