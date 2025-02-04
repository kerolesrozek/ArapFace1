import 'package:arapface1/features/home/presentation/views/home_view.dart';
import 'package:arapface1/features/user/presentation/views/user_profile_view.dart';
import 'package:flutter/material.dart';

class AppViews extends StatefulWidget {
  const AppViews({super.key});

  @override
  State<AppViews> createState() => _AppViewsState();
}

class _AppViewsState extends State<AppViews> {
  int currentIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const UserProfileView(),
   
    // const FootBallView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views.elementAt(currentIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              currentIndex: currentIndex,
              backgroundColor: Colors.greenAccent.shade200,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                  label: 'home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person),
                ),
                // BottomNavigationBarItem(
                //   label: 'Chat',
                //   icon: Icon(Icons.chat),
                // ),
                BottomNavigationBarItem(
                  label: 'Take face',
                  icon: Icon(Icons.face_5_rounded),
                ),
              ]),
        ),
      ),
    );
  }
}
