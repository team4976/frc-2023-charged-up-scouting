import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Scanner/ScanNav.dart';
import 'Auto.dart' as AutoFile;
import 'Teleop.dart' as Teleop;
import 'Functions.dart' as Functions;
import 'Endgame.dart' as Endgame;
import 'Pregameinfo.dart' as Pregame;
import 'QRcode.dart' as coder;
import 'Emailing.dart' as emailing;
import 'Scanner/scanner1.dart' as scanners1;
import 'Scanner/ScanNav.dart' as Second;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Worlds Version 1',

      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/Pregame': (context) => const Pregame.pregameinfo(title: 'Pregame'),
        '/Index': (context) => const MyHomePage(title: 'Robotics Title Page'),
        '/Auto': (context) => const AutoFile.AutoPage(title: 'Autonomous Period'),
        '/Teleop': (context) => const Teleop.teleop(title: 'Teleop'),
        '/Endgame': (context) => const Endgame.endgame(title: 'Final Info'),
        '/Coder' : (context) => const coder.qrcode(title: 'Show this'),
        '/Scanner1' : (context) => const scanners1.MyHomePage(title: "Scanner"),
        '/ScanNav': (context) => const Second.scanPage(title: "Scanning Page"),
        '/EmailingPage' : (context) => const emailing.emailing(title: "Emailing Page"),

      });

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Column(),
      appBar: AppBar(
        leading:IconButton(icon: const Icon(Icons.star), onPressed: (){},),
        title: const Text("Version 1"),
      ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {Functions.functions.instance.GotoPage('/Pregame', context);},
                    child:const Text("Start Scouting")),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () {Functions.functions.instance.GotoPage('/ScanNav', context);},
                    child:const Text("Scan Qr Code")),

              ],
            )));

    // This can add benifits
    // This trailing comma makes auto-formatting nicer for build methods.

  }
}
