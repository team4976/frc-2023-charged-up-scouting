import 'package:flutter/material.dart';
import 'Data.dart';


class functions{
  static void GotoPage(String Page, BuildContext context) => Navigator.pushNamed(context, Page);

  static SizedBox Textfield( var value) {


    return SizedBox(
      width: 200,
      child: TextField(
          decoration: const InputDecoration(
            labelText: dataclass.TeamNumbers,
            border: OutlineInputBorder(),
          ),
          onChanged: (String inputValue){
            if (value == "TeamNumber") {
              dataclass.TeamNumber = inputValue;
              print(dataclass.TeamNumber);
            }
          }
      ),
    );

  }


}