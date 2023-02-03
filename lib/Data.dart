import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Endgame.dart';
import 'dart:async';

class dataclass {
  // Static Instance to access everything
  static dataclass instance = new dataclass();


  Map<String, dynamic> data = {"Color Red" : false,
              "Color Blue" : false,
              "Team Number" : "Team Number",
              "Match Number": "Match Number",
              "Colour" : "Colour",
              "Moved": false,
              "Low" : 0,
              "Middle Cone" : 0,
              "Middle Cube" : 0,
              "High Cone" : 0,
              "High Cube" : 0,
              "Docked":false,
              "Engaged":false,
              "Hybrid" : 0,

              //Teleop
              "Middle Cube Teleop": 0,
              "Middle Cone Teleop" : 0,
              "Middle Miss Teleop" : 0,
              "High Cube Teleop": 0,
              "High Cone Teleop" : 0,
              "High Miss Teleop" : 0,

              // Defense
              "Opponent 1": "Opponent 1 Number",
              "Opponent 2": "Opponent 2 Number",
              "Opponent 3": "Opponent 3 Number",
              "Charge Station": "Charging Station Number?: ",


              // Timer
              "presses1" : true,
              "presses2" : true,
              "presses3" : true,
              "time1" : "Not on ",
              "time2" : "Not on ",
              "time3" : "Not on ",
              "TimeInfo1" : 0,
              "TimeInfo2" : 0,
              "TimeInfo3" : 0,
              "stopwatch1" : Stopwatch(),
              "stopwatch2" : Stopwatch(),
              "stopwatch3" : Stopwatch(),

              // Endgame Portion
              "presses4" : true,
              "time4": "Not on ",
              "TimeInfo4": 0,
              "stopwatch4": Stopwatch(),
              "Yellow Card": false,
              "Red Card": false,
              "Brokedown Card": false,
              "Repaired Card": false,
              "Foul Points": 0,
              "Docked Teleop": false,
              "Engaged Teleop" : false,
  };

  void TimerSetter(String presses, Object? time, String TimeInfo, Object? StopWatch) async {

    if ((dataclass.instance.data[presses] as bool)) {

        (dataclass.instance.data[StopWatch] as Stopwatch).start();
        dataclass.instance.data[time.toString()] = (dataclass.instance.data[time.toString()] == "On ") ? "Not on ": "On ";
        dataclass.instance.data[TimeInfo] = (dataclass.instance.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000;
        dataclass.instance.data[presses] = false;

    } else {

        (dataclass.instance.data[StopWatch] as Stopwatch).stop();
        dataclass.instance.data[time.toString()] = (dataclass.instance.data[time.toString()] == "Not on ") ? "On ": "Not on ";

        dataclass.instance.data[TimeInfo] = (dataclass.instance.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000;
        dataclass.instance.data[presses] = true;

    }


  }


}

