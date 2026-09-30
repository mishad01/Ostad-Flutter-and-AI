import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<User?> authChanges() => _auth.authStateChanges();

  //Sign Up
  static Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Sign IN (Email and Password)
  static Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //Sign In with google
  static Future<void> signInWithGoogle() async {
    //Google Account Picker
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();
    //Hold id Token
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    //Wrap google token in firebase credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  //Logout
  static Future<void> logOut() async {
    await GoogleSignIn.instance.signOut();
    await _auth.signOut();
  }
}
