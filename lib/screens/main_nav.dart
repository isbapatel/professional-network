import 'package:flutter/material.dart';
import '../app_state.dart';
import 'home_feed.dart';
import 'user_profile.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final app = AppState();

    // Screens list (NO CONST because last screen takes arguments)
    final screens = [
      const HomeFeedScreen(),
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
      UserProfileScreen(
        name: app.userName ?? "",
        role: app.userRole ?? "",
        image: app.userImage,
      ),
    ];

    return Scaffold(
      body: screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) => setState(() => _index = value),

        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add_outlined), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Notify"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}
