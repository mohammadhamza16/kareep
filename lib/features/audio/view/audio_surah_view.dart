import 'package:flutter/material.dart';
import 'package:kareeb/features/audio/audio_player_view.dart';
import 'package:kareeb/features/qrui/model/qari_model.dart';
import 'package:kareeb/features/surah/model/surah_model.dart';
import 'package:kareeb/features/surah/services/get_surah_service.dart';
import 'package:kareeb/helper/constants.dart';

class AudioSurahView extends StatefulWidget {
  const AudioSurahView({super.key, required this.qari});
  final QariModel qari;

  @override
  State<AudioSurahView> createState() => _AudioSurahViewState();
}

class _AudioSurahViewState extends State<AudioSurahView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Surah List',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<SurahModel>>(
          future: GetSurahService().surahService(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<SurahModel>? surah = snapshot.data;
              return ListView.builder(
                itemCount: surah?.length ?? 0,
                itemBuilder: (context, index) {
                  return AudioTile(
                    number: surah![index].number,
                    surahName: surah[index].englishName,
                    totalAya: surah[index].number,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerView(
                            qari: widget.qari,
                            index: index + 1,
                            list: surah,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}

class AudioTile extends StatelessWidget {
  final String surahName;
  final int totalAya;
  final int number;
  final VoidCallback onTap;

  const AudioTile({
    super.key,
    required this.surahName,
    required this.totalAya,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 0,
              color: Colors.black12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Wrap the Column inside an Expanded widget
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surahName,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total Ayahs: $totalAya',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.play_circle_fill,
                    color: Constants.kPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
