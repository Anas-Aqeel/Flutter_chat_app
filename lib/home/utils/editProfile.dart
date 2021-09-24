import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> editBio(String bio) async {
  try {
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore db = FirebaseFirestore.instance;
    userData['bio'] = bio;
    print(userData);
    await db.collection('users').doc(user.uid).set(userData);
    return 'user bio updated';
  } catch (e) {
    return e;
  }
}

Future<dynamic> editProfile(String name, String state, String country) async {
  try {
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore db = FirebaseFirestore.instance;
    userData['name'] = name;
    userData['state'] = state;
    userData['country'] = country;

    print(userData);
    await db.collection('users').doc(user.uid).set(userData);
    return 'user bio updated';
  } catch (e) {
    return e;
  }
}