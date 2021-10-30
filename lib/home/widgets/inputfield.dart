import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final type;
  final name;
  final icon;
  MyInputField({this.type, this.icon, this.name});
  @override
  Widget build(BuildContext context) {
    debugPrint(type);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: TextFormField(
          
          controller: name,
          style: TextStyle(fontSize: 20),
          obscureText: type == 'Password',
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