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
        body: SingleChildScrollView(
         child:Container(

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Is \n ${dataclass.instance.data["Opponent 1"]} \n defending?:  ", textAlign: TextAlign.center,),
                    ElevatedButton(onPressed: (){setState(() {
                      dataclass.instance.TimerSetter("presses1", "time1", "TimeInfo1", "stopwatch1");
                    });}, child: Text("${dataclass.instance.data["time1"]}: ${dataclass.instance.data["TimeInfo1"].toString()}"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Is \n ${dataclass.instance.data["Opponent 2"]} \n  defending?:  ", textAlign: TextAlign.center,),
                    ElevatedButton(onPressed: (){setState(() {
                      dataclass.instance.TimerSetter("presses2", "time2", "TimeInfo2", "stopwatch2");
                    });}, child: Text("${dataclass.instance.data["time2"]}: ${dataclass.instance.data["TimeInfo2"].toString()}"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("Is \n ${dataclass.instance.data["Opponent 3"]} \n defending?:  ", textAlign: TextAlign.center,),
                    ElevatedButton(onPressed: (){setState(() {
                      dataclass.instance.TimerSetter("presses3", "time3", "TimeInfo3", "stopwatch3");
                    });}, child: Text("${dataclass.instance.data["time3"]}: ${dataclass.instance.data["TimeInfo3"].toString()}"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${dataclass.instance.data["Charge Station"]}"),
                    ElevatedButton(onPressed: (){setState(() {
                      dataclass.instance.TimerSetter("presses4", "time4", "TimeInfo4", "stopwatch4");
                    });}, child: Text("${dataclass.instance.data["time4"]}: ${dataclass.instance.data["TimeInfo4"].toString()}"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 0,
                ),

                auto2(value: "Foul Points", description: "Foul Points: "),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height > 250? 250: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      checkbox2(value: "Docked Teleop".toString(), description: "Docked?: ".toString()),
                      checkbox2(value: "Engaged Teleop".toString(), description: "Engaged?: ".toString()),
                      checkbox2(value: "Yellow Card".toString(), description: "Did they get a yellow card: ".toString()),
                      checkbox2(value: "Red Card".toString(), description: "Did they get a red card: ".toString()),
                      checkbox2(value: "Brokedown Card".toString(), description: "Did they get a yellow card: ".toString()),
                      checkbox2(value: "Repaired Card".toString(), description: "Did they get repaired: ".toString()),
                    ],
                  ),

                )
              ],
            ),
          ),
        )));
  }
}
