import 'package:flutter/material.dart';
import 'Data.dart';

class defense extends StatefulWidget {
  defense({Key? key, required this.title}) : super(key: key);

  String title;
  @override
  _defenseState createState() => _defenseState();
}

class _defenseState extends State<defense> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ElevatedButton(onPressed: (){setState(() {
                dataclass.instance.TimerSetter("presses", "time1", "TimeInfo1", "stopwatch1");
              });}, child: Text("Timer ${dataclass.instance.data["time1"]}"))
          ],
        ),
      ),
    );
  }
}
