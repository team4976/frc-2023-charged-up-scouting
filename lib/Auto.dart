import 'package:flutter/material.dart';
import 'Functions.dart' as Functions;

class AutoPage extends StatefulWidget {
  const AutoPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _AutoPageState createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {


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

                ElevatedButton(onPressed: (){Functions.functions.instance.GotoPage("/Pregame", context);}, child:
                  Text(
                      "Back to Previous Page"
                  )),
                Text(""),
                ElevatedButton(onPressed: (){Functions.functions.instance.GotoPage("/Teleop", context);}, child:
                Text(
                    "Next Page"
                )),
              ])
       ])
    );
  }
}

