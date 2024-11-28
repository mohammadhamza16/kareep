// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kareeb/features/juz/model/juz_ayahs.dart';
import 'package:kareeb/features/juz/model/juz_model.dart';
import 'package:kareeb/features/juz/services/juz_service.dart';
import 'package:kareeb/helper/constants.dart';

class JuzView extends StatelessWidget {
  const JuzView({super.key});
  static String id = 'juz_view';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
          future: JuzService().getJuzz(Constants.juzIndex!),
          builder: (context, AsyncSnapshot<JuzModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              print('${snapshot.data!.juzAyahs.length} Length');
              return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                itemBuilder: (context, index) {
                  return JuzCustomTile(
                    list: snapshot.data!.juzAyahs,
                    index: index,
                  );
                },
              );
            }
            return Text(snapshot.error.toString());
            // ListView.builder
          },
        ),
      ),
    );
  }
}

class JuzCustomTile extends StatelessWidget {
  const JuzCustomTile({
    super.key,
    required this.index,
    required this.list,
  });
  final int index;
  final List<JuzAyahs> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 3),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            list[index].ayahNumber.toString(),
          ),
          Text(
            list[index].ayahsText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.end,
          ),
          Text(list[index].surahName, textAlign: TextAlign.end),
        ],
      ),
    );
  }
}
