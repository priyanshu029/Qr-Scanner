import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/screen/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_scanner/screen/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();
var _loggedInUser;
bool _isLoggedIn = false;
FirebaseAuth auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (await googleSignIn.isSignedIn()) {
    _isLoggedIn = true;
    print('logging in ');
    var currentUser = await googleSignIn.signIn();
    _loggedInUser = currentUser;
    // print('current user $currentUser');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _isLoggedIn ? HomePage(_loggedInUser.email) : AuthPage(),
    );
  }
}
