import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Data.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class qrcode extends StatefulWidget {
  const qrcode({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _qrcodeState createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  bool _isVisable = false;
  ScreenshotController _screenshotController = ScreenshotController();
  var mage;
  var image;

  void functions() async {
    mage = await QrPainter(
      data: (dataclass.instance.evaluvateData() + "~").toString(),
      version: QrVersions.auto,
      gapless: false,
    ).toImage(320);
  }

  Future<String> imagePath() async {
    var appDocDir = (await getApplicationDocumentsDirectory()).path;

    return '$appDocDir/qr.png';
  }

  Future<Image> _loadImage() async {
    return await imagePath().then((imagePath) => Image.asset(imagePath));
  }

  Future<void> _captureAndSaveQRCode() async {
    final imageDirectory = await imagePath();

    _screenshotController.captureFromWidget(Container(child: QrImage(
      data: (dataclass.instance.evaluvateData() + "~").toString(),
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    ),color: Colors.white,), delay: const Duration(seconds: 1)).then((value) async {
    image = value;

    final dir = await getApplicationDocumentsDirectory();
    final imagePath = await File('${dir.path}/captured.png').create();
    await imagePath.writeAsBytes(image!);


    ///Share
    await Share.shareFiles([imagePath.path]);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    functions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isVisable = true;
                      });
                    },
                    child: const Text("Generate")),
                Visibility(
                    visible: _isVisable,
                    child: Screenshot(
                      controller: _screenshotController,
                      child: QrImage(
                        data: (dataclass.instance.evaluvateData() + "~")
                            .toString(),
                        version: QrVersions.auto,
                        size: 320,
                        gapless: false,
                      ),
                    )),
                ElevatedButton(
                  onPressed: () async {
                    if (_isVisable) {
                      await _captureAndSaveQRCode();
                      var appDocDirs = (await getApplicationDocumentsDirectory())
                          .path;
                      appDocDirs = '$appDocDirs/qr.png';
                    }
                    setState(() {

                    });
                  },
                  child: const Text("Share"),
                )
              ],
            ),
          )),
    );
  }
}
