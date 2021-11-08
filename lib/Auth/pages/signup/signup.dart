// import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/Auth/pages/signup/signupUtils.dart';
import 'package:chat_app_ui/home/widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_ui/home/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hexcolor/hexcolor.dart';

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
        body: Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(minWidth: 200, maxWidth: 450),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Shimmer.fromColors(
                        period: Duration(seconds: 2),
                        highlightColor: HexColor('#0a0a0a'),
                        baseColor: HexColor('#001a42'),
                        child: Icon(
                          Icons.textsms,
                          size: 120,
                        )),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text('FireChat',
                        style: TextStyle(
                            color: accentColor,
                            fontSize: 27,
                            fontWeight: FontWeight.w900)),
                  ),
                  SizedBox(height: 40),
                  SizedBox(height: 20),
                  Text('Register Here',
                      style: GoogleFonts.amaticSc(
                          color: accentColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 10),
                   MyInputField(
                    type: 'Username',
                    icon: Icons.account_circle,
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
                  SizedBox(height: 15),
                  MaterialButton(
                      color: accentColor,
                      onPressed: () async {
                        String result = await register(
                            name.text, email.text, password.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('$result'),
                        ));
                        if (result == 'Registered Successfully') {
                          Navigator.pushNamed(context, '/HOME');
                        }
                      },
                      child: Text('Register',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      minWidth: double.maxFinite,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Forgot password?',
                          style: TextStyle(
                              color: accentColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w400)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/LOGIN');
                        },
                        child: Text("Already have account?",
                            style: TextStyle(
                                color: accentColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
