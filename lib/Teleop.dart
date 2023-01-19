import 'package:flutter/material.dart';
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
                    ElevatedButton(onPressed: (){Functions.functions.GotoPage("/Auto", context);}, child:
                    Text(
                        "Back to Previous Page"
                    )),
                    Text(""),
                    ElevatedButton(onPressed: (){Functions.functions.GotoPage("/Teleop", context);}, child:
                    Text(
                        "Next Page"
                    )),
                  ])
            ])
    );}
}
