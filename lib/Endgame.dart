
import 'Functions.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
import 'Auto.dart';

class endgame extends StatefulWidget {
  const endgame({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _endgameState createState() => _endgameState();

}

class _endgameState extends State<endgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
        child: ListView(
            shrinkWrap: true,
          children: [Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),

                const SizedBox(
                  height: 10,
                  width: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Charge Station: "),
                    ElevatedButton(onPressed: (){setState(() {
                      functions.instance.Dataclass.TimerSetter("presses4", "time4", "TimeInfo4", "stopwatch4");
                    });}, child: Text("${functions.instance.Dataclass.data["time4"]}: ${functions.instance.Dataclass.data["TimeInfo4"].toString()}"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 0,
                ),

                auto2(value: "Foul Points", description: "Foul Points: "),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [checkbox2(value: "Docked Teleop".toString(), description: "Docked?: ".toString()),
                checkbox2(value: "Engaged Teleop".toString(), description: "Engaged?: ".toString()),]),
                checkbox2(value: "Yellow Card".toString(), description: "Did they get a yellow card: ".toString()),
                checkbox2(value: "Red Card".toString(), description: "Did they get a red card: ".toString()),
                checkbox2(value: "Brokedown Card".toString(), description: "Did they breakdown: ".toString()),
                checkbox2(value: "Repaired Card".toString(), description: "Did they repair: ".toString()),
                checkbox2(value: "Fell".toString(), description: "Did they Fall?: ".toString()),
                ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: (){functions.instance.GotoPage("/Coder", context);},
                ),
                ElevatedButton(
                  child: const Text("Next Match"),
                  onPressed: (){print(functions.instance.Dataclass.data);functions.instance.Dataclass = dataclass();},
                )
              ],
            ),
          )],
        )));
  }
}
