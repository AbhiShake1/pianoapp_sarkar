import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../api/django_api.dart';

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
