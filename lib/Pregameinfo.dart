import 'package:flutter/material.dart';
import 'Functions.dart';
import 'Data.dart';


class pregameinfo extends StatefulWidget {
  const pregameinfo({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _pregameinfoState createState() => _pregameinfoState();
}

class _pregameinfoState extends State<pregameinfo> {
  static const String? TeamNumbers = "here";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                functions.instance.Textfield("Team Number"),
                functions.instance.Textfield("Match Number"),
                functions.instance.Textfield("Opponent 1"),
                functions.instance.Textfield("Opponent 2"),
                functions.instance.Textfield("Opponent 3"),
                functions.instance.Textfield("Name"),

                Text(functions.instance.Dataclass.data["Colour"].toString()),

                che(), // I forgor what did function does ong


                //Basic code for switching pages
                ElevatedButton(onPressed: (){functions.instance.GotoPage("/Pregame", context);}, child:
                const Text(
                    "Back to Previous Page"
                )),

                const Text(""),

                ElevatedButton(onPressed: (){functions.instance.GotoPage("/Auto", context);}, child:
                 const Text(
                    "Next Page"
                )),
              ],
            )));
  }
}
