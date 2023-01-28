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
                    Checkbox(value: (dataclass.instance.data["Moved"].toString().toLowerCase() == true), onChanged: (bool? value) {setState(() {dataclass.instance.data["Moved"] = (dataclass.instance.data["Moved"].toString().toLowerCase() == false);});},),
                    const Text("")
                  ],
                ),


                auto2(),



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

        IconButton(icon: const ImageIcon(AssetImage("images/minus.png"), size: 18),
              iconSize: 40,
              onPressed: (){setState(() {dataclass.instance.data["Low"]=int.parse(dataclass.instance.data["Low"].toString()) - 1;});}),
        Text("           " +
            dataclass.instance.data["Low"].toString() +
            "           "),
        IconButton(icon: const ImageIcon(AssetImage("imagez/plus.png"), size: 18),
            iconSize: 40,
            onPressed: (){setState(() {dataclass.instance.data["Low"]=int.parse(dataclass.instance.data["Low"].toString()) + 1;});}),
      ],),
    );
  }
}

