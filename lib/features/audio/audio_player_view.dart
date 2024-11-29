import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kareeb/features/qrui/model/qari_model.dart';
import 'package:kareeb/features/surah/model/surah_model.dart';

class AudioPlayerView extends StatefulWidget {
  final QariModel qari;
  final int index;
  final List<SurahModel>? list;

  const AudioPlayerView({
    super.key,
    required this.qari,
    required this.index,
    required this.list,
  });

  @override
  _AudioPlayerViewState createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  final AudioPlayer _player = AudioPlayer();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list![currentIndex - 1].englishName),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Playing Surah: ${widget.list![currentIndex - 1].englishName}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: () {
                    if (currentIndex > 1) {
                      setState(() {
                        currentIndex--;
                      });
                      _initAudioPlayer(); // Call without the URL
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () async {
                    await _player.resume();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () async {
                    await _player.pause();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {
                    if (currentIndex < widget.list!.length) {
                      setState(() {
                        currentIndex++;
                      });
                      _initAudioPlayer(); // Call without the URL
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
