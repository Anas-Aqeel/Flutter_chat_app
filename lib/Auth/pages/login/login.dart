import 'package:chat_app_ui/Auth/pages/login/loginUtils.dart';
import 'package:chat_app_ui/home/home.dart';
import 'package:chat_app_ui/home/widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hexcolor/hexcolor.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child:  Shimmer.fromColors(
                      period: Duration(seconds: 2),
              highlightColor: HexColor('#0a0a0a'),
                        baseColor: HexColor('#001a42'),
              child: Icon(
              Icons.textsms,
              size: 120,
            )
            ),
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
                  Text('Login Here',
                  
                      style: GoogleFonts.amaticSc(

                          color: accentColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w900)),
                          SizedBox(height: 10),
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
                        print(email.text);
                        print(password.text);
                        await handleUser(email.text, password.text);
                      },
                      child: Text('LOGIN',
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
                          Navigator.pushNamed(context, '/SIGNUP');
                        },
                        child: Text("Don't have account?",
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
    );
  }
}



// class MyButton extends StatelessWidget {
//   final txt;
//   final txtColor;
//   final bgColor;
//   MyButton({this.txt, this.bgColor, this.txtColor});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       color: bgColor,
//       onPressed: () {
//         print('/$txt');
//         Navigator.pushNamed(context, '/$txt');
//       },
//       child: Text('$txt', style: TextStyle(color: txtColor, fontSize: 15)),
//       minWidth: 260,
//       height: 50,
//       shape:
//           StadiumBorder(side: BorderSide(width: 1, color: Colors.deepPurple)),
//     );
//   }
// }
