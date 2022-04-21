import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fyp/api/django_api.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:fyp/feature/Karaoke/karaoke.dart';
import 'package:fyp/feature/Mysongs/views/Mysongs.dart';
import 'package:fyp/feature/aboutus/view/aboutus.dart';
import 'package:fyp/feature/addsongs/views/addsongs.dart';
import 'package:fyp/feature/artist/views/artist.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final List<String> imgList = [
  "https://www.businesscoot.com/uploads/study_main_image/227.webp",
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          actions: const [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 150, 0),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "SanFranciscos",
                      fontSize: 20,
                      decorationColor: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      drawer: const MainDrawer(),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              height: 550,
              padding: const EdgeInsets.only(top: 30),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 600,
                  aspectRatio: 9 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  Image.asset('images/img1.jpg'),
                  Image.asset('images/img3.jpg'),
                  Image.asset('images/img2.png'),
                  Image.asset('images/img4.jpg'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.black,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Artist()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage('images/artist.jpg'),
                                    fit: BoxFit.cover)),
                            height: 40,
                            width: 50,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const CircleBorder(),
                          ),
                        ),
                        const Text('Artist',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300))
                      ],
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Karaoke()),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage('images/karaoke.webp'),
                                        fit: BoxFit.fill)),
                                height: 40,
                                width: 50,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const CircleBorder(),
                              ),
                            ),
                            const Text('Karaoke',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300))
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const CustomAlertDialog(),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage('images/requesr.jpg'),
                                        fit: BoxFit.cover)),
                                height: 40,
                                width: 50,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const CircleBorder(),
                              ),
                            ),
                            const Text('Request',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300))
                          ],
                        )),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddSongs()),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage('images/mysongs.jpg'),
                                      fit: BoxFit.cover)),
                              height: 40,
                              width: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: const CircleBorder(),
                            ),
                          ),
                          const Text(
                            'My Songs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Mysongs()),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage('images/artist.jpg'),
                                      fit: BoxFit.cover)),
                              height: 40,
                              width: 50,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: const CircleBorder(),
                            ),
                          ),
                          const Text('My Playlist',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300))
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Contact()),
                                );
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                        image: AssetImage('images/about_us.jpg'),
                                        fit: BoxFit.cover)),
                                height: 40,
                                width: 50,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const CircleBorder(),
                              ),
                            ),
                            const Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends HookWidget {
  const CustomAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artistController = useTextEditingController();
    final songController = useTextEditingController();
    return AlertDialog(
      backgroundColor: Colors.black,
      title: const Text(
        'Request a song',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VxTextField(
            controller: artistController,
            fillColor: Colors.white,
            hint: 'Enter Artist Name',
            borderType: VxTextFieldBorderType.roundLine,
          ),
          const SizedBox(height: 30),
          VxTextField(
            controller: songController,
            fillColor: Colors.white,
            hint: 'Enter Song Name',
            borderType: VxTextFieldBorderType.roundLine,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: context.pop,
          textColor: Colors.white,
          child: const Text('Cancel'),
        ),
        FlatButton(
          onPressed: () async => await DjangoApi.requestMusic(
                  artist: artistController.text, songName: songController.text)
              .whenComplete(
            () => context.showToast(
              msg: 'The song has been requested',
              position: VxToastPosition.top,
              showTime: 1000,
            ),
          ),
          textColor: Colors.white,
          child: const Text('Request'),
        ),
      ],
    );
  }
}
