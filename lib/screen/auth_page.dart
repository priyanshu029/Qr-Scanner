import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_scanner/screen/mark_attendance.dart';
import 'package:qr_scanner/service/google_signIn.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Qr Scanner',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                  ),
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: () async {
                    var currentUser = await GoogleAuth().gsignIn();
                    if (currentUser != null) {
                      print('Lets go to home page');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MarkAttendence(currentUser);
                      }));
                    } else {
                      print('some thing went wrong');
                    }
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Sign In With Google',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
