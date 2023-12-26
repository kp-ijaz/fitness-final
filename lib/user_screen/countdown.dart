import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/report_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/db%20model/report_model.dart';
import 'package:homeworkout/user_screen/roundButton_countdown.dart';
import 'package:homeworkout/user_screen/user_report_screen.dart';
import 'package:intl/intl.dart';

class CountdownPage extends StatefulWidget {
  List<String> image;
  Typelevel level;
  CountdownPage({Key? key, required this.image, required this.level})
      : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  String id = '';
  int? timer;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.level == Typelevel.beginner
          ? const Duration(seconds: 20)
          : widget.level == Typelevel.intermediate
              ? const Duration(seconds: 30)
              : const Duration(seconds: 40),
    );
    controller.addListener(() {
      setState(() {
        if (controller.isAnimating) {
          setState(() {
            isPlaying = true;
          });
        } else {
          setState(() {
            isPlaying = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      ),
      body: ListView(
        children: [
          Container(
            height: 350,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Card(
                      color: const Color.fromARGB(255, 3, 12, 44),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 380,
                          child: Column(
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(widget.image[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, _) => const SizedBox(
                      width: 1,
                    ),
                itemCount: widget.image.length),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Text(
                  countText,
                  style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "${DateFormat("yyyy-MM-dd").format(DateTime.now())}",
                //   style: TextStyle(color: Colors.amber),
                // ),
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      print(controller.value);
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                    icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: const RoundButton(
                    icon: Icons.stop,
                  ),
                ),
              ],
            ),
          ),
          controller.value == 0
              ? Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        addreports();
                      },
                      child: TextButton(
                        onPressed: () {
                          ReportData(
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              controller.value);
                        },
                        child: const Text(
                          'finish',
                          style: TextStyle(color: Colors.amber, fontSize: 18),
                        ),
                      )),
                )
              : Container()
        ],
      ),
    );
  }

  Future<void> addreports() async {
    id = DateFormat("yyyy-MM-dd").format(DateTime.now());
    if (widget.level == Typelevel.beginner) {
      timer = 20;
    } else if (widget.level == Typelevel.intermediate) {
      timer = 30;
    } else {
      timer = 40;
    }
    final report = Reportmodal(id: id, time: [timer!]);
    await ReportDB().addReport(report);
  }
}
