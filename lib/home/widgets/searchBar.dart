import 'package:chat_app_ui/home/pages/Friends.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: (e) async {
          List results = [];
          FirebaseFirestore.instance
              .collection("users")
              .get()
              .then((QuerySnapshot querySnapshot) {
            querySnapshot.docs.forEach((doc) {
              dynamic name = doc['name'];
              if (name == e) {
                print('successful');
                setState(() {


                  results.add(doc.data());
                });
              }
            });
            setState(() {
              print('object');
              data = results;
            });
            // print(data);
          });
          print(e);
        },
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade100)),
        ));
  }
}
