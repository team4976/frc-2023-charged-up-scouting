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


                checkbox2(value: "Moved", description: "Has it moved"),


                auto2(value: "Low", description: "Low Cones:",),
                auto2(value: "Middle Cone", description: "Middle Cones:",),
                auto2(value: "Middle Cube", description: "Middle Cubes:",),
                auto2(value: "High Cube", description: "High Cubes:",),
                auto2(value: "High Cone", description: "High Cones:",),

                checkbox2(value: "Moved", description: "Has it docked?:"),
                checkbox2(value: "Moved", description: "Has it engaged?:"),


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
  auto2({Key? key, required this.value, required this.description}) : super(key: key);

  String value;
  String description;

  @override
  _auto2State createState() => _auto2State();
}

class _auto2State extends State<auto2> {
  @override
  Widget build(BuildContext context) {
    return CoolButton(widget.value, widget.description);
  }
  Container CoolButton(String Value, String description) {

    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(description),

        IconButton(icon: const ImageIcon(AssetImage("images/minus.png"), size: 18),
              iconSize: 40,
              onPressed: (){setState(() {dataclass.instance.data[Value]=int.parse(dataclass.instance.data[Value].toString()) - 1;});}),
        Text("           " +
            dataclass.instance.data[Value].toString() +
            "           "),
        IconButton(icon: const ImageIcon(AssetImage("imagez/plus.png"), size: 18),
            iconSize: 40,
            onPressed: (){setState(() {dataclass.instance.data[Value]=int.parse(dataclass.instance.data[Value].toString()) + 1;});}),
      ],),
    );
  }
}

class checkbox2 extends StatefulWidget {
  checkbox2({Key? key, required this.value, required this.description}) : super(key: key);

  String value;
  String description;

  @override
  _checkbox2State createState() => _checkbox2State();
}

class _checkbox2State extends State<checkbox2> {
  @override
  Widget build(BuildContext context) {
    return CoolButton(widget.value, widget.description);
  }
  Container CoolButton(String Value, String description) {
    return Container(
      child: Row (mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(description),
          Checkbox(value: (dataclass.instance.data[Value].toString().toLowerCase() == true), onChanged: (bool? value) {setState(() {dataclass.instance.data[Value] = (dataclass.instance.data[Value].toString().toLowerCase() == false);});},),
          const Text("")
        ],
      ),
    );
  }
}

