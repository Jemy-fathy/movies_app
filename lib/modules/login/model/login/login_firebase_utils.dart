import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/modules/login/model/app_user.dart';

class LoginFirebaseUtils {
  final FirebaseFirestore _db;

  LoginFirebaseUtils(this._db);

  CollectionReference<AppUser> _getUsersCollection() {
    return _db.collection("users").withConverter<AppUser>(
      fromFirestore: (snapshot, _) => AppUser.fromFireStore(snapshot.data()!),
      toFirestore: (user, _) => user.toFireStore(),
    );
  }

  /// create user for first time login using google login
  Future<void> createUser(AppUser user) async {
    final usersRef = _getUsersCollection();

    // UID should come from FirebaseAuth
    final docRef = usersRef.doc(user.id);

    await docRef.set(user);
  }

  /// Get current logged-in user data
  Future<AppUser?> getUser(String uid) async {
    final usersRef = _getUsersCollection();

    final doc = await usersRef.doc(uid).get();

    if (!doc.exists) return null;

    return doc.data();
  }

  /// Update user profile
  Future<void> updateUser(AppUser user) async {
    final usersRef = _getUsersCollection();

    await usersRef.doc(user.id).update(user.toFireStore());
  }

  /// Delete user account
  Future<void> deleteUser(String uid) async {
    final usersRef = _getUsersCollection();

    await usersRef.doc(uid).delete();
  }
}