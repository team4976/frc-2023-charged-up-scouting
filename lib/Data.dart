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


              // Timer
              "presses" : false,
              "presses2" : false,
              "presses3" : false,
              "time1" : "Not on",
              "time2" : "Not on",
              "time3" : "Not on",
              "TimeInfo1" : 0,
              "TimeInfo2" : 0,
              "TimeInfo3" : 0,
              "stopwatch1" : Stopwatch(),
              "stopwatch2" : Stopwatch(),
              "stopwatch3" : Stopwatch(),
  };

  TimerSetter(String presses, Object? time, String TimeInfo, Object? StopWatch) async {

    print(this.data[TimeInfo]);
    if ((this.data[presses] as bool)) {

        (this.data[StopWatch] as Stopwatch).start();
        this.data[time.toString()] = "On " + ((this.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000).toString();
        this.data[TimeInfo] = (this.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000;
        this.data[presses] = false;

    } else {

        (this.data[StopWatch] as Stopwatch).stop();
        this.data[time.toString()] = "Not on " + ((this.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000).toString();
        this.data[TimeInfo] = (this.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000;
        this.data[presses] = true;

    }


  }

}