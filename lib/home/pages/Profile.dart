import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/home.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:chat_app_ui/home/widgets/drawer.dart';

// import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
// import 'package:chat_app_ui/home/widgets/editBioBox.dart';
// import 'package:chat_app_ui/home/widgets/editProfileBox.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:chat_app_ui/home/utils/theme_helper.dart';

import 'package:chat_app_ui/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: MyBottomAppBar(),
//         body: SafeArea(
//           child: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                       color: Colors.blueGrey[200],
//                       height: MediaQuery.of(context).size.height / 1.7,
//                       child: Column(
//                         children: [
//                           ProfileNavBar(),
//                           SizedBox(height: 25),
//                           Stack(
//                             children: [
//                               SizedBox(
//                                 width: 350,
//                                 height: 280,
//                               ),
//                               Positioned(
//                                 bottom: 1,
//                                 left: 20,
//                                 right: 20,
//                                 child: Container(
//                                   height: 200,
//                                   width: 250,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       border: Border.all(
//                                           color: Colors.blueGrey, width: 1),
//                                       borderRadius: BorderRadius.circular(30)),
//                                   child: Column(
//                                     children: [
//                                       SizedBox(height: 60),
//                                       UsernameText(),
//                                       SizedBox(height: 5),
//                                       Location(),
//                                       SizedBox(height: 10),
//                                       AddFriendBtn()
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               ProfilePicture()
//                             ],
//                           ),
//                         ],
//                       )),
//                   ProfileFooter()
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }

// class ProfileFooter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController bio =
//         TextEditingController(text: '${userData['bio']} ');
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Bio:',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w800,
//                     fontSize: 22,
//                     color: Colors.blueGrey[800]),
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   await editBioBox(context, bio);
//                 },
//                 child: Icon(
//                   Icons.edit,
//                   color: Colors.blueGrey,
//                 ),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10, top: 7),
//             child: Text(
//               "${userData['bio']}",
//               style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.blueGrey[400]),
//               textAlign: TextAlign.left,
//             ),
//           )
//         ],
//       ),
//     );
//   }

// }
// class AddFriendBtn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {},
//       child: Text('Message'),
//       style: ElevatedButton.styleFrom(
//         onPrimary: Colors.blueGrey,
//         primary: Colors.white,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(width: 1.5, color: Colors.blueGrey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

// class Location extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.add_location_outlined,
//           color: Colors.blueGrey,
//         ),
//         SizedBox(width: 5),
//         Text(
//           '${userData['state']}, ${userData['country']}',
//           style: TextStyle(
//               fontSize: 14,
//               color: Colors.blueGrey,
//               fontWeight: FontWeight.w700),
//         )
//       ],
//     );
//   }
// }

// class UsernameText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Anas Aqeel',
//       style: TextStyle(
//           fontSize: 25,
//           letterSpacing: 1.2,
//           fontWeight: FontWeight.w800,
//           color: Colors.blueGrey.shade800),
//     );
//   }
// }

// class ProfilePicture extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: 0,
//       right: 0,
//       child: CircleAvatar(
//         backgroundColor: Colors.blueGrey[100],
//         radius: 60,
//         child: ClipOval(

//         child: Image.network(
//           userData["profilePic"],
//         ),
//       ),
//     ));
//   }
// }

// class ProfileNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Icon(
//           Icons.close,
//           size: 33,
//           color: Colors.blueGrey[800],
//         ),
//         GestureDetector(
//           onTap: ()async{
//           },
//           child: Icon(
//             Icons.edit,
//             size: 30,
//             color: Colors.blueGrey[800],
//           ),
//         ),
//       ],
//     );
//   }
// }

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(),
      appBar: AppBar(
       title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 16,
            ),
            child: Icon(Icons.settings),
          )
        ],
      flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
    
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
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
                      child: platform
                          ? Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.grey.shade200,
                            )
                          : Image.network('${userData['profilePic']}'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${userData['name']}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Former President',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Location"),
                                          subtitle:
                                              Text("${userData['country']}"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle:
                                              Text("${userData['email']}"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("99--99876-56"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("About Me"),
                                          subtitle: Text("${userData['bio']}"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



            // await editProfileBioBox(context);
            // await editBioBox(context, bio);