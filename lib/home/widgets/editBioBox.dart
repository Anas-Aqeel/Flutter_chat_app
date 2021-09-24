import 'package:chat_app_ui/home/utils/editProfile.dart';
import 'package:flutter/material.dart';

editBioBox(BuildContext context, TextEditingController bio) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Write your bio"),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close))
            ],
          ),
          content: TextFormField(
            controller: bio,
            maxLength: 250,
            minLines: 1,
            maxLines: 6,
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                dynamic result = await editBio(bio.text);
                print(result);
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
