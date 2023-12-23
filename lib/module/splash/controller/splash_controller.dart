import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';

class SplashController extends State<SplashView> {
  static late SplashController instance;
  late SplashView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    checkLogin();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  checkLogin() async {
    //print('TOKEN =====>>>>> ${AppSession.token}');

    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(const DashboardView());
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(const LoginView());
      });
    }
  }
}
