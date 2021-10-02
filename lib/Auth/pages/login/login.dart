import 'package:chat_app_ui/Auth/pages/login/loginUtils.dart';
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

class MyInputField extends StatelessWidget {
  final type;
  final name;
  final icon;
  MyInputField({this.type, this.icon, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: TextField(
          controller: name,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: '$type',
              hintStyle: TextStyle(fontSize: 19, color: Colors.black54),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.deepPurple[700],
                ),
              ),
              border: InputBorder.none),
        ));
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
