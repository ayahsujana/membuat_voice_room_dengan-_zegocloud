import 'package:beellii/app_session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  static init() async {
    AppSession.userId = FirebaseAuth.instance.currentUser!.uid;
    AppSession.userName =
        FirebaseAuth.instance.currentUser!.displayName ?? "No Name";

    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.docs.isNotEmpty) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "name": FirebaseAuth.instance.currentUser!.displayName,
      "email": FirebaseAuth.instance.currentUser!.email,
      "photo": FirebaseAuth.instance.currentUser!.photoURL,
      "status": "Unavailable"
    });
  }
}
