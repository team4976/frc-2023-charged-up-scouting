import 'package:flutter/material.dart';
import 'Auto.dart' as AutoFile;
import 'Functions.dart' as Functions;

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

        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        // Add the routes here
        '/Index': (context) => MyHomePage(title: 'Robotics Title Page'),
        '/Auto': (context) => AutoFile.AutoPage(title: 'Autonomous Period')
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
      appBar: AppBar(

        title: Text(widget.title),
      ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/Auto');}, child:
                Text(
                  "Start Scouting"
                )),
                Text(""),
                ElevatedButton(onPressed: () {/*Navigator.pushNamed(context, '/Auto');*/}, child:
                Text(
                    "Convert to a qr code"
                ))
              ],
            )));

    // This can add benifits
      // This trailing comma makes auto-formatting nicer for build methods.

  }
}
