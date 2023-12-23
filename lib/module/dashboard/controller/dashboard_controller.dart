import 'package:beellii/services/user_service/user_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  doLogout() async {
    await UserStatus.setStatus("Offline");
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    Get.offAll(const LoginView());
  }
}
