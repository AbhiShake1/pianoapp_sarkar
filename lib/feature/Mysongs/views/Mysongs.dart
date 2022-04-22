import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:fyp/feature/addsongs/views/addsongs.dart';
import 'package:fyp/feature/artist/views/artist_song.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../artist/views/artist.dart';

class AllSongs extends ConsumerWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, dynamic> songs = ref
        .watch(songsRef)
        .maybeWhen(data: (d) => jsonDecode(d ?? '{}'), orElse: () => {});
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final entry in songs.entries)
            Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/metallica.webp',
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    context.push(
                      (context) => ArtistSong(songDetailsList: entry.value),
                    );
                  },
                  title: Text(
                    entry.key,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class Mysongs extends StatefulHookConsumerWidget {
  const Mysongs({Key? key}) : super(key: key);

  @override
  _MysongsState createState() => _MysongsState();
}

class _MysongsState extends ConsumerState<Mysongs> {
  int index = 0;

  final pages = const [AllSongs(), AddSongs(), Artist()];

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              icon: Image.asset(
                'images/menu.png',
                height: 20,
                color: Colors.black,
              ),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              }),
          backgroundColor: Colors.white,
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 80, 0),
              child: Text("Song List",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
      drawer: const MainDrawer(),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.call_split_outlined), label: 'All  Songs'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Songs'),
          BottomNavigationBarItem(icon: Icon(Icons.art_track), label: 'Artists'),
        ],
      ),
    );
  }
}
