import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final googleSignIn = GoogleSignIn();
  Future<String> gsignIn() async {
    var user;
    final auth = FirebaseAuth.instance;
    print('I am here 00');
    try {
      user = await googleSignIn.signIn();
      final googleSignInAuthentication = user.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      // final User user = authResult.user;


    } catch (e) {
      print(e);
    }
    print(user.displayName);
    if (user == null) {
      return null;
    } else {
      return await user.currentUser.email;
    }
  }
}
