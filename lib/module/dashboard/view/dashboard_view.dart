import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return DefaultTabController(
      
      length: 2,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL ??
                              "https://cdn-icons-png.flaticon.com/512/5087/5087579.png"))),
            ),
          ),
          title: const Text('Beellii'),
          actions: [
            IconButton(
              onPressed: () => controller.doLogout(),
              icon: const Icon(
                Icons.logout,
                size: 24.0,
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            RoomsView(),
            UsersView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.spatial_audio_off_rounded,
              ),
              label: "Rooms",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
              ),
              label: "Users",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
