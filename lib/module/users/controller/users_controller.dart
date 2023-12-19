import 'package:beellii/services/user_service/user_status.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import '../view/users_view.dart';

class UsersController extends State<UsersView> with WidgetsBindingObserver {
  static late UsersController instance;
  late UsersView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    UserStatus.setStatus("Online");
    setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //online
      UserStatus.setStatus('Online');
      print('===>>> ONLINE');
    } else {
      //offline
      UserStatus.setStatus('Offline');
      print('===>>> OFFLINE');
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  
}
