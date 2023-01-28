import 'package:flutter/material.dart';
import 'Data.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

enum Colors {Red, Blue}

class functions{
  static functions instance = new functions();

  Colors? _colour = Colors.Red;

  void GotoPage(String Page, BuildContext context) => Navigator.pushNamed(context, Page);
  Container Textfield(var value, bool text) {

    return Container (child: Column(children: [
      SizedBox(
      width: 200,
      child: TextField(
          decoration: InputDecoration(
            labelText: text ? "Team Number": "Match Number",
            border: OutlineInputBorder(),
          ),
          onChanged: (String inputValue){

              if (value == "Team Number") {
                dataclass.instance.data[value] = inputValue;
              } else if (value == "Match Number") {
                dataclass.instance.data[value] = inputValue;
              }
            }

      ),
    ),
    const Text("")
    ]));

  }

  Widget Colour() {

    return SizedBox(width: 400, child:Row(
      mainAxisSize: MainAxisSize.min,
      children: [


          SizedBox(
            width: 200,
            child: RadioListTile<Colors>(
              title: const Text('Red'),
              value: Colors.Red,
              groupValue: _colour,
              onChanged: (Colors? value) {

                _colour = value;

              },
            ),
          ),

          SizedBox(
            width: 200,
            child: RadioListTile<Colors>(
              title: const Text('Blue'),
              value: Colors.Blue,
              groupValue: _colour,
              onChanged: (Colors? value) {
                _colour = value;
                print(_colour);
              },
            ),
          ),
        ],

    ));


  }

}

class che extends StatefulWidget {
  const che({Key? key}) : super(key: key);

  @override
  cheState createState() => cheState();
}


class cheState extends State<che>{
  static Colors? _colour = Colors.Red;

  Widget Information() {
    return (
        SizedBox(width: 400, child:Row(
          mainAxisSize: MainAxisSize.min,
          children: [


            SizedBox(
              width: 200,
              child: RadioListTile<Colors>(
                title: const Text('Red'),
                value: Colors.Red,
                groupValue: _colour,
                onChanged: (Colors? value) {
                  setState((){_colour = value;dataclass.instance.data["Color Red"]=true;dataclass.instance.data["Color Blue"]=false;});
                },
              ),
            ),

            SizedBox(
              width: 200,
              child: RadioListTile<Colors>(
                title: const Text('Blue'),
                value: Colors.Blue,
                groupValue: _colour,
                onChanged: (Colors? value) {
                  setState((){_colour = value;dataclass.instance.data["Color Red"]=false;dataclass.instance.data["Color Blue"]=true;});
                },
              ),
            ),
          ],

        ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Information();
  }
}
