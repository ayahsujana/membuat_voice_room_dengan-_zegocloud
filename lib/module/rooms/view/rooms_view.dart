import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({Key? key}) : super(key: key);

  Widget build(context, RoomsController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rooms"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("rooms").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      bool isHost = item["host"]["uid"] ==
                          FirebaseAuth.instance.currentUser!.uid;
                      return Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://static.vecteezy.com/system/resources/previews/018/753/727/original/podcast-voice-room-flat-illustration-icon-logo-design-on-white-background-free-vector.jpg",
                            ),
                          ),
                          title: Text(
                            item["room_name"],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            item["host"]["name"],
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: ElevatedButton(
                              onPressed: () => Get.to(RoomDetailView(room: item, isHost: isHost)),
                              child: isHost
                                  ? const Text('Masuk Room')
                                  : const Text('Join Room')),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('New Room'),
        onPressed: () => Get.to(const AddRoomsView()),
      ),
    );
  }

  @override
  State<RoomsView> createState() => RoomsController();
}
