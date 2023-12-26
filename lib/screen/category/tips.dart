import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tipspage extends StatefulWidget {
  final String url;
  const Tipspage({super.key, required this.url});

  @override
  State<Tipspage> createState() => _TipspageState();
}

class _TipspageState extends State<Tipspage> {
  final _AddDietcontroller = TextEditingController();
  var videourl;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    videourl = widget.url;
    var videoID = YoutubePlayer.convertUrlToId(videourl);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

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
            body: SafeArea(
                child: SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                      aspectRatio: 16 / 9,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: const ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent),
                        ),
                        const PlaybackSpeedButton(),
                        FullScreenButton(),
                      ],
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [player],
                      );
                    },
                  )
                ],
              )),
            ))));
  }
}
