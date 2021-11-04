import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      color: Colors.black,
      size: 50.0,
    );
  }
}
