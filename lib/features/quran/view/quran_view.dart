import 'package:flutter/material.dart';
import 'package:kareeb/features/juz/view/juz_view.dart';
import 'package:kareeb/features/surah/view/surah_view.dart';
import 'package:kareeb/helper/constants.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Updated length to match the number of tabs
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 239, 207, 245),
            title: const Text(
              'Quran',
            ),
            centerTitle: true,
            bottom: const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Surah',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Juz',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              SurahView(),
              JuzWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class JuzWidget extends StatefulWidget {
  const JuzWidget({
    super.key,
  });

  @override
  State<JuzWidget> createState() => _JuzWidgetState();
}

class _JuzWidgetState extends State<JuzWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 30,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Constants.juzIndex = (index + 1);
                });

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const JuzView()));
              },
              child: Card(
                elevation: 4,
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
