import 'package:flutter/material.dart';
import 'Auto.dart' as AutoFile;
import 'Teleop.dart' as Teleop;
import 'Functions.dart' as Functions;
import 'Endgame.dart' as Endgame;
import 'Pregameinfo.dart' as Pregame;
import 'QRcode.dart' as coder;
import 'Emailing.dart' as emailing;
import 'Scanner/scanner1.dart' as scanners1;
import 'Scanner/scanner2.dart' as scanners2;
import 'Scanner/scanner3.dart' as scanners3;
import 'Scanner/scanner4.dart' as scanners4;
import 'Scanner/scanner5.dart' as scanners5;
import 'Scanner/scanner6.dart' as scanners6;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.green,

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
        '/Scanner2' : (context) => const scanners2.MyHomePage(title: "Scanner2"),
        '/Scanner3' : (context) => const scanners3.MyHomePage(title: "Scanner3"),
        '/Scanner4' : (context) => const scanners4.MyHomePage(title: "Scanner4"),
        '/Scanner5' : (context) => const scanners5.MyHomePage(title: "Scanner5"),
        '/Scanner6' : (context) => const scanners6.MyHomePage(title: "Scanner6"),
        '/EmailingPage' : (context) => const emailing.emailing(title: "Emailing Page")
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
        leading:IconButton(icon:Icon(Icons.star), onPressed: (){},),
        title: Text(widget.title),
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
                ElevatedButton(onPressed: () {Functions.functions.instance.GotoPage('/Scanner1', context);},
                    child:const Text("Scan Qr Code")),

              ],
            )));

    // This can add benifits
    // This trailing comma makes auto-formatting nicer for build methods.

  }
}
