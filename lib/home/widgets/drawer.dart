import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class MyDrawer extends StatelessWidget {
  // const MyDrawer({ Key? key }) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: HexColor('#001433'),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    HexColor('#0a0a0a'),
                    HexColor('#001433'),
                  ],
                ),
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  currentAccountPicture: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.grey.shade200,
                      ),
                      backgroundImage:
                          NetworkImage('${userData['profilePic']}'),
                    ),
                  ),
                  accountName: Text('Anas Aqeel'),
                  accountEmail: Text('anasaqeel.5555@gmail.com')),
            ),
            ListTile(
              tileColor: Colors.grey[100],
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/CHATS');
              },
            ),
            ListTile(
              tileColor: Colors.grey[100],
              leading: Icon(Icons.post_add),
              title: Text('Friends'),
              onTap: () {
                Navigator.pushNamed(context, '/FRIENDS');
              },
            ),
            ListTile(
              tileColor: Colors.grey[100],
              leading: Icon(Icons.my_library_books),
              title: Text('Groups'),
              onTap: () {
                Navigator.pushNamed(context, '/GROUPS');
              },
            ),
            ListTile(
              tileColor: Colors.grey[100],
              leading: Icon(Icons.save),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/PROFILE');
              },
            ),
            ListTile(
              tileColor: Colors.grey[100],
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, '/SETTINGS');
              },
            ),
            ListTile(
              tileColor: Colors.grey[100],
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
