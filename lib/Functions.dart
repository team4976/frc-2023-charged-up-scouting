import 'package:flutter/material.dart';
import 'Data.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

enum enum_Colors {Red, Blue}

class functions{
  dataclass Dataclass  = dataclass();
  dataclass Dataclass1  = dataclass();
  static functions instance = new functions();

  enum_Colors? _colour = enum_Colors.Red;

  void GotoPage(String Page, BuildContext context) => Navigator.pushNamed(context, Page);
  Container Textfield(var value) {

    return Container (child: Column(children: [
      SizedBox(
      width: 200,
      child: TextField(
          decoration: InputDecoration(
            labelText: value,
            border: OutlineInputBorder(),
          ),
          onChanged: (String inputValue){
              functions.instance.Dataclass.data[value] = inputValue + ',';

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
            child: RadioListTile<enum_Colors>(
              title: const Text('Red'),
              value: enum_Colors.Red,
              groupValue: _colour,
              onChanged: (enum_Colors? value) {

                _colour = value;

              },
            ),
          ),

          SizedBox(
            width: 200,
            child: RadioListTile<enum_Colors>(
              title: const Text('Blue'),
              value: enum_Colors.Blue,
              groupValue: _colour,
              onChanged: (enum_Colors? value) {
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
  static enum_Colors? _colour = enum_Colors.Red;

  Widget Information() {
    return (
        SizedBox(width: 400, child:Row(
          mainAxisSize: MainAxisSize.min,
          children: [


            SizedBox(
              width: 150,
              child: RadioListTile<enum_Colors>(
                title: const Text('Red'),
                value: enum_Colors.Red,
                groupValue: _colour,
                onChanged: (enum_Colors? value) {
                  setState((){_colour = value;functions.instance.Dataclass.data["Color Red"]=true;functions.instance.Dataclass.data["Color Blue"]=false;functions.instance.Dataclass.data["Colour"]=0;});
                },
              ),
            ),

            SizedBox(
              width: 150,
              child: RadioListTile<enum_Colors>(
                title: const Text('Blue'),
                value: enum_Colors.Blue,
                groupValue: _colour,
                onChanged: (enum_Colors? value) {
                  setState((){_colour = value;functions.instance.Dataclass.data["Color Red"]=false;functions.instance.Dataclass.data["Color Blue"]=true;functions.instance.Dataclass.data["Colour"]=1;});
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
