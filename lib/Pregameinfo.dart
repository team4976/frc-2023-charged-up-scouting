import 'package:flutter/material.dart';
import 'Functions.dart';
import 'Data.dart' as Data;

class pregameinfo extends StatefulWidget {
  const pregameinfo({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _pregameinfoState createState() => _pregameinfoState();
}

class _pregameinfoState extends State<pregameinfo> {


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

                SizedBox( // <-- SEE HERE
                  width: 200,
                  child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Team Number',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String inputValue){
                        Data.dataclass.TeamNumber = inputValue;
                      }
                  ),
                ),
                const Text(""),
                SizedBox( // <-- SEE HERE
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Match Number',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String inputValue){
                      Data.dataclass.MatchNumber = inputValue;
                    }
                  ),
                ),

                //Basic code for switching pages
                ElevatedButton(onPressed: (){functions.GotoPage("/Index", context);}, child:
                const Text(
                    "Back to Previous Page"
                )),

                const Text(""),

                ElevatedButton(onPressed: (){functions.GotoPage("/Auto", context);}, child:
                 const Text(
                    "Next Page"
                )),
              ],
            )));
  }
}
