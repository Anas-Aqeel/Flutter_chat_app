import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  final type;
  final name;
  final icon;
  MyInputField({this.type, this.icon, this.name});

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          onSaved: (e) {
            setState(() {
              widget.name.text = e;
            });
            print(widget.name.text);
          },
          onFieldSubmitted: (e) {
            setState(() {
              widget.name.text = e;
            });
            print(widget.name.text);
          },
          controller: widget.name,
          style: TextStyle(fontSize: 20),
          obscureText: widget.type == 'Password',
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: '${widget.type}',
              hintStyle: TextStyle(fontSize: 19, color: Colors.black54),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  widget.icon,
                  size: 28,
                  color: accentColor,
                ),
              ),
              border: InputBorder.none),
        ));
  }
}
