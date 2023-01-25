import 'package:flutter/material.dart';
import 'Functions.dart' hide Colors;
import 'Data.dart';

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

                // This is if it moved in any certain way
                Row (mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text("Moved? "),
                    Checkbox(value: dataclass.moved, onChanged: (bool? value) {setState(() {dataclass.moved = dataclass.moved ? false: true;});},),
                    const Text("")
                  ],
                ),






                ElevatedButton(onPressed: (){functions.instance.GotoPage("/Pregame", context);}, child:
                  const Text(
                      "Back to Previous Page"
                  )),
                const Text(""),
                ElevatedButton(onPressed: (){functions.instance.GotoPage("/Teleop", context);}, child:
                  const Text(
                    "Next Page"
                )),
              ])
       ])
    );
  }
}

class auto2 extends StatefulWidget {
  const auto2({Key? key}) : super(key: key);

  @override
  _auto2State createState() => _auto2State();
}

class _auto2State extends State<auto2> {
  @override
  Widget build(BuildContext context) {
    return CoolButton();
  }
  Container CoolButton() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Has the Robot Moved?: "),
        Flexible(
            child: FloatingActionButton(backgroundColor: Colors.green,child: const ImageIcon(AssetImage("images/minus.png"),
              color: Colors.lightGreen,
              size: 18,),
                onPressed: (){setState(() {dataclass.low-=1;});})),
        Text("           " +
            dataclass.low.toString() +
            "\t\t\t\t\t\t"),
        Flexible(

            child: FloatingActionButton(backgroundColor: Colors.green,child: const ImageIcon(AssetImage("imagez/plus.png"),
              color: Colors.lightGreen,
              size: 18, ),
                onPressed: (){setState(() {dataclass.low+=1;});})),
      ],),
    );
  }
}

