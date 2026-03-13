import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/modules/login/model/login/login_firebase_utils.dart';
import 'package:movies_app/modules/login/model/app_user.dart';

class LoginHandler {
  final LoginFirebaseUtils firebaseUtils;
  final FirebaseAuth auth;

  LoginHandler(this.firebaseUtils, this.auth);

  Future<AppUser?> login(String email, String password) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;
    final user = await firebaseUtils.getUser(uid);
    return user;
  }
}
