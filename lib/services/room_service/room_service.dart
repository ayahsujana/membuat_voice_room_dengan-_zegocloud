import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoomService {
  static createRoom({required String roomName}) async {
    await FirebaseFirestore.instance.collection("rooms").add({
      "room_name": roomName,
      "host": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
      }
    });
  }
}
