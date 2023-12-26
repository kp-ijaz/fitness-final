// import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

class UserTipspage extends StatelessWidget {
  UserTipspage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          title: const Text('TIPS'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
