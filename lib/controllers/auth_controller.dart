import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  User? get user => _auth.currentUser;
  Stream<User?> get userChanged => _auth.userChanges();

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    var credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _auth.signInWithCredential(credentials);
  }

  void signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
