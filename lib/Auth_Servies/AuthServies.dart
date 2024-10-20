import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  

  
  Stream<User?> get userState {
    return _auth.authStateChanges();
  }

  Future SigninWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      final user = await _auth.signInWithCredential(credential);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




Future SigninWithGitHub() async {
  try {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    final user = await _auth.signInWithProvider(githubAuthProvider);
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}








}

