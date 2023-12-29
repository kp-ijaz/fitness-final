import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/screen/category/notifications.dart';
import 'package:homeworkout/screen/category/settings.dart';
import 'package:homeworkout/user_screen/user_home.dart';
import 'package:homeworkout/user_screen/user_report_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserFluidbottom extends StatefulWidget {
  const UserFluidbottom({super.key});

  @override
  State createState() {
    return _FluidbottomState();
  }
}

class _FluidbottomState extends State {
  Widget? _child;

  @override
  void initState() {
    _child = const UserHom();
    getUser();
    super.initState();
  }

  String userNames = 'user';

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.amber,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 90),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('assets/images/fitnes9.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 5,
                    child: Text(
                      userNames,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            ' Terms and conditions',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            ' Privacy policy',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'FAQ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          extendBody: true,
          body: _child,
          bottomNavigationBar: FluidNavBar(
            animationFactor: 0.2,
            icons: [
              FluidNavBarIcon(
                  icon: Icons.home,
                  backgroundColor: const Color.fromARGB(255, 3, 12, 44)),
              FluidNavBarIcon(
                  icon: Icons.bar_chart,
                  backgroundColor: const Color.fromARGB(255, 3, 12, 44)),
              FluidNavBarIcon(
                  icon: Icons.notifications,
                  backgroundColor: const Color.fromARGB(255, 3, 12, 44)),
              FluidNavBarIcon(
                  icon: Icons.settings,
                  backgroundColor: const Color.fromARGB(255, 3, 12, 44)),
            ],
            onChange: _handleNavigationChange,
            style: const FluidNavBarStyle(
              iconSelectedForegroundColor: Colors.amber,
              iconUnselectedForegroundColor: Colors.white,
              barBackgroundColor: Color.fromARGB(255, 153, 163, 129),
            ),
            scaleFactor: 1.5,
            itemBuilder: (icon, item) => Semantics(
              // label: ["label"],
              child: item,
            ),
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const UserHom();
          break;
        case 1:
          _child = const UserReport();
          break;
        case 2:
          _child = const Notifications();
          break;
        case 3:
          _child = const Settings();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  void getUser() async {
    var shared = await SharedPreferences.getInstance();
    userNames = shared.getString('user')!;
    setState(() {});
  }
}
