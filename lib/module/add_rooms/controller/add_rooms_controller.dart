import 'package:beellii/services/room_service/room_service.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';

class AddRoomsController extends State<AddRoomsView> {
  static late AddRoomsController instance;
  late AddRoomsView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String roomName = '';
  doCreateRoom() async {
    await RoomService.createRoom(roomName: roomName);
    print('============>>>>>>>>>>>> $roomName');
    Get.back();
  }
}
