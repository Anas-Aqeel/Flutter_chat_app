import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey.shade600,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      type: BottomNavigationBarType.fixed,
      onTap: (e) {
        switch (e) {
          case 0:
            Navigator.pushNamed(context, '/CHATS');
            break;
          case 2:
            Navigator.pushNamed(context, '/FRIENDS');
            break;
          case 3:
            Navigator.pushNamed(context, '/PROFILE');
            break;
          default:
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: "Groups",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: "Friends",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: "Profile",
        ),
      ],
    );
  }
}
