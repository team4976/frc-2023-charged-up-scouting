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
                    auto2(value: "Middle Cube Teleop", description: "Middle Cube: "),
                    auto2(value: "Middle Cone Teleop", description: "Middle Cone: "),
                    auto2(value: "Middle Miss Teleop", description: "Any misses in middle: "),
                    auto2(value: "High Cube Teleop", description: "High Cube: "),
                    auto2(value: "High Cone Teleop", description: "High Cone: "),
                    auto2(value: "High Miss Teleop", description: "Any misses in high: "),


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
