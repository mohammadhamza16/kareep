import 'package:flutter/material.dart';
import 'package:kareeb/features/audio/view/audio_surah_view.dart';
import 'package:kareeb/features/qrui/service/qari_service.dart';
import 'package:kareeb/helper/api.dart';
import 'package:kareeb/features/qrui/model/qari_model.dart';

class QariPlayerView extends StatelessWidget {
  const QariPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Qari\'s'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 0.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      Text('Search'),
                      Spacer(),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: FutureBuilder(
                  future: QariService().getQariList(Api()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Error fetching data.',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              '${snapshot.error}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final qariList = snapshot.data as List<QariModel>;
                      if (qariList.isEmpty) {
                        return const Center(child: Text('No Qaris available.'));
                      }
                      return ListView.builder(
                        itemCount: qariList.length,
                        itemBuilder: (context, index) {
                          final qari = qariList[index];
                          return ListTile(
                            title: Text(qari.name ?? 'Unknown Qari'),
                            subtitle: Text(qari.name ?? 'No details available'),
                            trailing: IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AudioSurahView(
                                              qari: snapshot.data![index],
                                            )));
                              },
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Text('No data available.'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
