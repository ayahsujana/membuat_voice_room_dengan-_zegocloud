import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import '../controller/users_controller.dart';

class UsersView extends StatefulWidget {
  const UsersView({Key? key}) : super(key: key);

  Widget build(context, UsersController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
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
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          item["photo"],
                        ),
                      ),
                      title: Text(item["name"]),
                      subtitle: Text(item["email"]),
                      trailing: Text(
                        item["status"],
                        style: const TextStyle(color: Colors.green),
                      )),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  State<UsersView> createState() => UsersController();
}
