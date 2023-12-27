import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/report_db.dart';
// import 'package:homeworkout/db%20model/category/report_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/db%20model/report_model.dart';
// import 'package:homeworkout/db%20model/report_model.dart';
import 'package:homeworkout/user_screen/roundButton_countdown.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

class CountdownTimerPage extends StatefulWidget {
  List<String> image;
  Typelevel level;
  CountdownTimerPage({Key? key, required this.image, required this.level})
      : super(key: key);

  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  Timer? _timer;
  int _remainingSeconds;
  bool isPlaying = false;
  String id = '';
  late int time;
  late int startSeconds;

  _CountdownTimerPageState({startSeconds = 30})
      : _remainingSeconds = startSeconds;

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        isPlaying = false;
      });
    } else {
      _timer = Timer.periodic(oneSecond, (Timer timer) {
        if (_remainingSeconds <= 0) {
          setState(() {
            timer.cancel();
            isPlaying = false;
          });
        } else {
          setState(() {
            _remainingSeconds--;
            isPlaying = true;
          });
        }
      });
    }
  }

  void _stopCountdown() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      setState(() {
        isPlaying = false;
      });
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatTime(_remainingSeconds),
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  _remainingSeconds == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                              onPressed: () {
                                ReportDB().addReport(Reportmodal(
                                    id: DateFormat("yyyy-MM-dd")
                                        .format(DateTime.now()),
                                    time: [30]));
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Finished',
                                style: TextStyle(
                                    color: Colors.amber, fontSize: 18),
                              )),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            onTap: _startCountdown,
                            child: RoundButton(
                              icon: isPlaying == true
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> addreport() async {
  //   id = DateFormat("yyyy-MM-dd").format(DateTime.now());
  //   time = time + startSeconds;
  //   Reportmodal(id: id, time: time);
  // }
}
