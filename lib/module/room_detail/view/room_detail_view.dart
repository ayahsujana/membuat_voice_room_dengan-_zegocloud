// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:beellii/core.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';


class RoomDetailView extends StatefulWidget {
  RoomDetailView({
    Key? key,
    required this.room,
    required this.isHost
  }) : super(key: key);
  final Map room;
  bool isHost = false;

  Widget build(context, RoomDetailController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text(room["room_name"]),
        actions: const [],
      ),
      body: SafeArea(
        child: ZegoUIKitPrebuiltLiveAudioRoom(
          appID: AppSession.appId,
          appSign: AppSession.appSign,
          userID: AppSession.userId,
          userName: AppSession.userName,
          roomID: room["id"],
          config: isHost
              ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
              : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience(),
        ),
      ),
    );
  }

  @override
  State<RoomDetailView> createState() => RoomDetailController();
}
