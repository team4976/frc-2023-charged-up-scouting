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
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                functions.instance.Textfield("TeamNumber", true),
                functions.instance.Textfield("TeamNumber", false),

                Text(dataclass.Colour),
                che(),


                //Basic code for switching pages
                ElevatedButton(onPressed: (){functions.instance.GotoPage("/Index", context);}, child:
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
