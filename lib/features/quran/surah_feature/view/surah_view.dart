import 'package:flutter/material.dart';
import 'package:kareeb/features/quran/surah_feature/model/surah_model.dart';
import 'package:kareeb/features/quran/services/get_surah_service.dart';
import 'package:kareeb/features/quran/surah_feature/view/widgets/surah_custom_list_tile.dart';

class SurahView extends StatelessWidget {
  const SurahView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SurahModel>>(
      future: GetSurahService().surahService(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No Surahs available'),
          );
        }

        final surahs = snapshot.data!;
        return ListView.builder(
          itemCount: surahs.length,
          itemBuilder: (context, index) {
            final surah = surahs[index];
            return SurahCustomListTile(
              surah: surah,
              onTap: () {},
            );
          },
        );
      },
    );
  }
}
