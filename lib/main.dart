import 'package:flutter/material.dart';
import 'Auto.dart' as AutoFile;
import 'Teleop.dart' as Teleop;
import 'Functions.dart' as Functions;
import 'Endgame.dart' as Endgame;
import 'Pregameinfo.dart' as Pregame;
import 'Defense.dart' as Defend;

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

        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        // Add the routes here
        '/Pregame': (context) => Pregame.pregameinfo(title: 'Pregame'),
        '/Index': (context) => MyHomePage(title: 'Robotics Title Page'),
        '/Auto': (context) => AutoFile.AutoPage(title: 'Autonomous Period'),
        '/Teleop': (context) => Teleop.teleop(title: 'Teleop'),
        '/Endgame': (context) => Endgame.endgame(title: 'Final Info'),
        '/Defense': (context) => Defend.defense(title: 'Defense')
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
                ElevatedButton(onPressed: () {Functions.functions.instance.GotoPage('/Defense', context);}, child://'/Pregame', context);}, child:
                Text(
                  "Start Scouting"
                )),

              ],
            )));

    // This can add benifits
      // This trailing comma makes auto-formatting nicer for build methods.

  }
}
