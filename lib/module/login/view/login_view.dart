import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400]),
                  onPressed: () => controller.doLogin(),
                  child: const Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    ));
  }

  @override
  State<LoginView> createState() => LoginController();
}
