import 'package:chat_app_ui/Auth/authenticator.dart';
// import 'package:chat_app_ui/home/chatScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
        body: Center(
          child: Text("Error")
        ),
      );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Authenticator();
        }
        return Scaffold(
          body: Center(
            child: SpinKitFadingCube(
                       color: Colors.purple,
                        size: 120.0,
                      ),
          ),
        );
      },
    );
  }
}
