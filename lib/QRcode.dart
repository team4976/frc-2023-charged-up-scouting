import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Data.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';

class qrcode extends StatefulWidget {
  const qrcode({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _qrcodeState createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  bool _isVisable = false;
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Screenshot<Widget>(
            controller: screenshotController,
            child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){setState(() {
                        _isVisable = true;
                      });}, child: const Text("Generate")),

                      Visibility(
                        visible: _isVisable,
                        child: QrImage(
                          data: (dataclass.instance.evaluvateData() + "~").toString(),
                          version: QrVersions.auto,
                          size: 320,
                          gapless: false,
                        ),),

                    ],
                  ),
                )
            ),
        ),);
  }
}
