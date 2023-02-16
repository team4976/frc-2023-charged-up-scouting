import 'package:flutter/material.dart';
import 'Auto.dart';
import 'Functions.dart' as Functions;

class teleop extends StatefulWidget {
  const teleop({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _teleopState createState() => _teleopState();
}

class _teleopState extends State<teleop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: PageView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    auto2(value: "Hybrid Teleop", description: "Hybrid: "),
                    auto2(value: "Middle Cube Teleop", description: "Middle Cube: "),
                    auto2(value: "Middle Cone Teleop", description: "Middle Cone: "),
                    auto2(value: "Middle Miss Teleop", description: "Any misses in middle: "),
                    auto2(value: "High Cube Teleop", description: "High Cube: "),
                    auto2(value: "High Cone Teleop", description: "High Cone: "),
                    auto2(value: "High Miss Teleop", description: "Any misses in high: "),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Is \n ${Functions.functions.instance.Dataclass.data["Opponent 1"]} \n defending?:  ", textAlign: TextAlign.center,),
                        ElevatedButton(onPressed: (){setState(() {
                          Functions.functions.instance.Dataclass.TimerSetter("presses1", "time1", "TimeInfo1", "stopwatch1");
                        });}, child: Text("${Functions.functions.instance.Dataclass.data["time1"]}: ${Functions.functions.instance.Dataclass.data["TimeInfo1"].toString()}"))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                      width: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Is \n ${Functions.functions.instance.Dataclass.data["Opponent 2"]} \n  defending?:  ", textAlign: TextAlign.center,),
                        ElevatedButton(onPressed: (){setState(() {
                          print(Functions.functions.instance.Dataclass.data["Opponent 2"]);
                          print(0/0);
                          Functions.functions.instance.Dataclass.TimerSetter("presses2", "time2", "TimeInfo2", "stopwatch2");
                        });}, child: Text("${Functions.functions.instance.Dataclass.data["time2"]}: ${Functions.functions.instance.Dataclass.data["TimeInfo2"].toString()}"))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                      width: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text("Is \n ${Functions.functions.instance.Dataclass.data["Opponent 3"]} \n defending?:  ", textAlign: TextAlign.center,),
                        ElevatedButton(onPressed: (){setState(() {
                          Functions.functions.instance.Dataclass.TimerSetter("presses3", "time3", "TimeInfo3", "stopwatch3");
                        });}, child: Text("${Functions.functions.instance.Dataclass.data["time3"]}: ${Functions.functions.instance.Dataclass.data["TimeInfo3"].toString()}"))
                      ],
                    ),

                    ElevatedButton(onPressed: (){Functions.functions.instance.GotoPage("/Auto", context);}, child:
                    const Text(
                        "Back to Previous Page "
                    )),
                    const Text(""),
                    ElevatedButton(onPressed: (){Functions.functions.instance.GotoPage("/Endgame", context);}, child:
                    const Text(
                        "Next Page"
                    )),
                  ])
            ])
    );}
}
