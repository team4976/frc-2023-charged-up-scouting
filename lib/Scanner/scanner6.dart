import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Functions.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
//import 'package:flutter/foundation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String _result = "";

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated:_onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  ' Data: ${result!.code}')/*describeEnum*/
                  : const Text('Scan a code'),
            ),
          ),
          ElevatedButton(onPressed: (){if(functions.instance.Dataclass.scannerCheck(_result, 5)){functions.instance.GotoPage('/EmailingPage', context);}}, child: const Text("Next Scanner"))

        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    log("Workin");

    controller.scannedDataStream.listen((scanData) {
      _result = scanData.code.toString();
      print(_result);
      functions.instance.Dataclass.data["Scanner6"] = _result;
    });

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}