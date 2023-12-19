import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  Widget build(context, SplashController controller) {
    controller.view = this;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/previews/018/753/727/original/podcast-voice-room-flat-illustration-icon-logo-design-on-white-background-free-vector.jpg"),
                      fit: BoxFit.cover)),
            ),
            const Text('Welcome to Voice Room')
          ],
        ),
      )),
    );
  }

  @override
  State<SplashView> createState() => SplashController();
}
