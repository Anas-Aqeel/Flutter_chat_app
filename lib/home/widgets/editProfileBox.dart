import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:chat_app_ui/home/utils/editProfile.dart';
import 'package:chat_app_ui/home/utils/pickImage.dart';
import 'package:chat_app_ui/home/utils/uploadPic.dart';
import 'package:flutter/material.dart';

dynamic profileImage = '';
dynamic imageName = '';
dynamic link = userData['profilePic'];

editProfileBioBox(BuildContext context) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController name = TextEditingController();
      TextEditingController state = TextEditingController();
      TextEditingController country = TextEditingController();
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Edit your profile"),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close))
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await pickImage();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey[100],
                  backgroundImage:
                      profileImage != '' ? FileImage(profileImage) : null,
                  radius: 60,
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(name,
                  hntTxt: 'Name', icn: Icons.account_circle_outlined),
              SizedBox(height: 10),
              CustomTextField(state,
                  hntTxt: 'Your current city',
                  icn: Icons.add_location_alt_outlined),
              SizedBox(height: 10),
              CustomTextField(
                country,
                hntTxt: 'Your current Country',
                icn: Icons.location_city,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              print(imageName);
              if (imageName != '') {
                await uploadPic(imageName, profileImage);
              }
              await editProfile(name.text, state.text, country.text, link);
              Navigator.pop(context);
            },
            child: Text('Save'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              onPrimary: Colors.blueAccent.shade200,
              primary: Colors.white,
            ),
          )
        ],
      );
    },
  );
}

class CustomTextField extends StatelessWidget {
  final hntTxt;
  final icn;
  final TextEditingController txt;
  CustomTextField(this.txt, {this.hntTxt, this.icn});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      controller: txt,
      decoration: InputDecoration(
        prefixIcon: Icon(icn),
        hintText: '$hntTxt',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
        ),
      ),
    );
  }
}
