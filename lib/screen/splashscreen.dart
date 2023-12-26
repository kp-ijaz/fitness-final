import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/message_db.dart';
import 'package:homeworkout/screen/admin_or_user.dart';
// import 'package:homeworkout/btmnavigation.dart';
// import 'package:homeworkout/login.dart';

class Splashscrn extends StatefulWidget {
  const Splashscrn({super.key});

  @override
  State<Splashscrn> createState() => _SplashscrnState();
}

class _SplashscrnState extends State<Splashscrn> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => Admin_user_page()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/fitness11.jpg',
                )),
          ),
          height: double.infinity,
          width: double.infinity,
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 460, right: 35),
                child: Text(
                  'Home workout',
                  style: TextStyle(
                      color: Color.fromARGB(75, 255, 255, 255),
                      fontSize: 43.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 90, top: 2),
                child: Text(
                  "If it doesn't challenge you, it doesn't \nchange you",
                  style: TextStyle(
                      color: Color.fromARGB(108, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
