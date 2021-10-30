import 'package:chat_app_ui/Auth/pages/login/loginUtils.dart';
import 'package:chat_app_ui/home/widgets/inputfield.dart';
import 'package:flutter/material.dart';

//  void _showDialog(BuildContext context,String title,String content) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: new Text("Alert Dialog title"),
//           content: new Text("Alert Dialog body"),
//           actions: <Widget>[
//             new MaterialButton(
//               child: new Text("Close"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
class Login extends StatelessWidget {
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
                    color: Colors.deepPurple[900],
                  ),
                  SizedBox(height: 10),
                  Text('FireChat',
                      style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontSize: 27,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 40),
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
                  SizedBox(height: 45),
                  MaterialButton(
                    color: Colors.deepPurple.shade600,
                    onPressed: () async {
                      print(email.text);
                      print(password.text);

                      await handleUser(email.text, password.text);
                     
                      
                    },
                    child: Text('LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    minWidth: 260,
                    height: 50,
                    shape: StadiumBorder(
                        side: BorderSide(width: 1, color: Colors.deepPurple)),
                  ),
                  SizedBox(height: 7),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SIGNUP');
                    },
                    child: Text('or signup instead',
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
