import 'package:flutter/material.dart';
import 'package:fyp/core/widgets/main_drawer.dart';
import 'package:fyp/feature/Notification/providers/notification_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
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
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 130, 0),
                child: Text("Notification",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
            child: Consumer(
          builder: (context, ref, child) => Column(
            children: ref.watch(notificationRef).maybeWhen(
                orElse: () => [const Center(child: CircularProgressIndicator())],
                data: (data) =>
                    data
                        ?.map(
                          (e) => Row(
                            children: [Text(e!['title']), Text(e['description'])],
                          ),
                        )
                        .toList() ??
                    []),
          ),
        )));
  }
}
