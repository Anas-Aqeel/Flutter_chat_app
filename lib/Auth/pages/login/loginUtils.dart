import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

Future<dynamic> login(String email, String password) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // UserCredential user  =
     await auth.signInWithEmailAndPassword(
        email: "$email", password: "$password");
    return 'logged in Successfully';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }
  } catch (e) {
    return "the error is \n$e";
  }
  throw {
    
  };
}

Future<dynamic> fetchUserData(String uid)async{
  try {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot client = await db.collection('users').doc(uid).get();
    return client.data(); 
  } catch (e) {
    return 'the error is \n$e';
  }
}

Future<void> handleUser(String email, String password)async{
   Future
    .wait([login(email,password)])
    .then((List responses)=> responses)
    .catchError((e) => e);
}

Future getUserData(String uid){
   return Future
    .wait([
     fetchUserData(uid)
    ])
    .then((List responses){
      print(responses[0]);
     return responses[0];
      })
    .catchError((e) => e);
}