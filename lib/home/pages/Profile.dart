// import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/widgets/bottomAppBar.dart';
import 'package:chat_app_ui/home/widgets/editBioBox.dart';
import 'package:chat_app_ui/home/widgets/editProfileBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyBottomAppBar(),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      color: Colors.blueGrey[200],
                      height: MediaQuery.of(context).size.height / 1.7,
                      child: Column(
                        children: [
                          ProfileNavBar(),
                          SizedBox(height: 25),
                          Stack(
                            children: [
                              SizedBox(
                                width: 350,
                                height: 280,
                              ),
                              Positioned(
                                bottom: 1,
                                left: 20,
                                right: 20,
                                child: Container(
                                  height: 200,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 1),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 60),
                                      UsernameText(),
                                      SizedBox(height: 5),
                                      Location(),
                                      SizedBox(height: 10),
                                      AddFriendBtn()
                                    ],
                                  ),
                                ),
                              ),
                              ProfilePicture()
                            ],
                          ),
                        ],
                      )),
                  ProfileFooter()
                ],
              ),
            ),
          ),
        ));
  }
}

class ProfileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController bio =
        TextEditingController(text: '${userData['bio']} ');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bio:',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                    color: Colors.blueGrey[800]),
              ),
              GestureDetector(
                onTap: () async {
                  await editBioBox(context, bio);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 7),
            child: Text(
              "${userData['bio']}",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[400]),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

 
}
class AddFriendBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Message'),
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.blueGrey,
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_location_outlined,
          color: Colors.blueGrey,
        ),
        SizedBox(width: 5),
        Text(
          '${userData['state']}, ${userData['country']}',
          style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

class UsernameText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Anas Aqeel',
      style: TextStyle(
          fontSize: 25,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w800,
          color: Colors.blueGrey.shade800),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: CircleAvatar(
        backgroundColor: Colors.blueGrey[100],
        radius: 60,
      ),
    );
  }
}

class ProfileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.close,
          size: 33,
          color: Colors.blueGrey[800],
        ),
        GestureDetector(
          onTap: ()async{
            await editProfileBioBox(context);
          },
          child: Icon(
            Icons.edit,
            size: 30,
            color: Colors.blueGrey[800],
          ),
        ),
      ],
    );
  }
}
