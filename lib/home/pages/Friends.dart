import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:flutter/material.dart';

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(),
      body: Center(child: Text('Friends'),),
    );
  }
}