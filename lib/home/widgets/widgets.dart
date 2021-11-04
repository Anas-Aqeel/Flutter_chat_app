import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  PrimaryText(this.text,
      {this.fontWeight = FontWeight.w600,
      this.size = 16,
      this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/PROFILE');
      },
      elevation: 0,
      highlightColor: Colors.pink[100],
      shape: StadiumBorder(),
      color: Colors.pink[50],
      child: Row(
        children: [
          Icon(
            Icons.add,
            size: 25,
            color: Colors.pink[500],
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            'Add New',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }
}
