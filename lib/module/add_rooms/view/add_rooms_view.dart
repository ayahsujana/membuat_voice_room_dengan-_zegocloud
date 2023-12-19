import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import '../controller/add_rooms_controller.dart';

class AddRoomsView extends StatefulWidget {
  const AddRoomsView({Key? key}) : super(key: key);

  Widget build(context, AddRoomsController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("AddRooms"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              maxLength: 20,
              decoration: const InputDecoration(
                labelText: 'Room name',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                  ),
                ),
                helperText: "Your room name's",
              ),
              onChanged: (value) {
                controller.roomName = value;
                
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () => controller.doCreateRoom(),
          child: const Text(
            'Create Room',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  State<AddRoomsView> createState() => AddRoomsController();
}
