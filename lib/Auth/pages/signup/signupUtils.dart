import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> register(String name, String email, String password) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await db.collection("users").doc(user.user!.uid).set({
      'name': '$name',
      'email': '$email',
      'country': '',
      'state': '',
      'bio': '',
      'profilePic':'',
      'chats': []
    });
    DocumentSnapshot client = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.user!.uid)
        .get();
    userData = client.data();
    return 'Registered Successfully';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
  } catch (e) {
    return "$e";
  }
  throw {};
}
