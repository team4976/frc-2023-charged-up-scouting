import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Endgame.dart';
import 'Functions.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:async';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class dataclass {
  // Static Instance to access everything
  static dataclass instance = dataclass();

  // In the future add in constructor
  Map<String, dynamic> data = {
    "Color Red": false,
    "Color Blue": false,
    "Team Number": "0",
    "Match Number": "0",
    "Colour": "Colour",
    "Moved": false,
    "Middle Cone": 0,
    "Middle Cube": 0,
    "High Cone": 0,
    "High Cube": 0,
    "Docked": false,
    "Engaged": false,
    "Hybrid": 0,

    //Teleop
    "Hybrid Teleop": 0,
    "Middle Cube Teleop": 0,
    "Middle Cone Teleop": 0,
    "Middle Miss Teleop": 0,
    "High Cube Teleop": 0,
    "High Cone Teleop": 0,
    "High Miss Teleop": 0,

    // Defense
    "Opponent 1": "0",
    "Opponent 2": "0",
    "Opponent 3": "0",
    "Charge Station": "0",

    // Timer
    "presses1": true,
    "presses2": true,
    "presses3": true,
    "time1": "Not on ",
    "time2": "Not on ",
    "time3": "Not on ",
    "TimeInfo1": 0,
    "TimeInfo2": 0,
    "TimeInfo3": 0,
    "stopwatch1": Stopwatch(),
    "stopwatch2": Stopwatch(),
    "stopwatch3": Stopwatch(),

    // Endgame Portion
    "presses4": true,
    "time4": "Not on ",
    "TimeInfo4": 0,
    "stopwatch4": Stopwatch(),
    "Fell": false,
    "Yellow Card": false,
    "Red Card": false,
    "Brokedown Card": false,
    "Repaired Card": false,
    "Foul Points": 0,
    "Docked Teleop": false,
    "Engaged Teleop": false,

    //Scanner
    "Scanner1": "",
    "change222": false
  };

  Set<String> queue = Set();

  void TimerSetter(
      String presses, Object? time, String TimeInfo, Object? StopWatch) async {
    if ((functions.instance.Dataclass.data[presses] as bool)) {
      (functions.instance.Dataclass.data[StopWatch] as Stopwatch).start();
      functions.instance.Dataclass.data[time.toString()] =
          (functions.instance.Dataclass.data[time.toString()] == "On ")
              ? "Not on "
              : "On ";
      functions.instance.Dataclass.data[TimeInfo] =
          (functions.instance.Dataclass.data[StopWatch] as Stopwatch)
                  .elapsedMilliseconds /
              1000;
      functions.instance.Dataclass.data[presses] = false;
    } else {
      (functions.instance.Dataclass.data[StopWatch] as Stopwatch).stop();
      functions.instance.Dataclass.data[time.toString()] =
          (functions.instance.Dataclass.data[time.toString()] == "Not on ")
              ? "On "
              : "Not on ";

      functions.instance.Dataclass.data[TimeInfo] =
          (functions.instance.Dataclass.data[StopWatch] as Stopwatch)
                  .elapsedMilliseconds /
              1000;
      functions.instance.Dataclass.data[presses] = true;
    }
  }

  Object collection(String param) {
    return functions.instance.Dataclass.data[param];
  }

  String evaluvateData() {
    var moved = collection("Moved") == true ? "1" : "0";
    var docked = collection("Docked") == true ? "1" : "0";
    var engaged = collection("Engaged") == true ? "1" : "0";
    var thing = collection("Docked") == true ? "1" : "0";
    if (collection("Docked") == "true" || collection("Engaged") == "true") {
      thing = "1";
    }
    var yellow = collection("Yellow Card") == true ? "1" : "0";
    var red = collection("Red Card") == true ? "1" : "0";
    var brokedown = collection("Brokedown Card") == true ? "1" : "0";
    var repaired = collection("Repaired Card") == true ? "1" : "0";
    var fell = collection("Fell") == true ? "1" : "0";

    var color = collection("Colour").toString() == "Colour"
        ? "0"
        : collection("Colour").toString();

    // Pre Match Info
    String info =
        "${collection("Team Number")}, ${collection("Match Number")}, $color, ";

    // Autonomous
    info = info +
        "$moved, ${collection("Hybrid")}, ${collection("Middle Cube")}, ${collection("Middle Cone")}, ${collection("High Cube")}, ${collection("High Cone")}, $thing, ";
    info = info + "$docked, $engaged, $thing, ";

    // Teleop
    info = info + "${collection("Hybrid Teleop")}, ";
    info = info +
        "${collection("Middle Cube Teleop")}, ${collection("Middle Cone Teleop")}, ${collection("Middle Miss Teleop")}, ${collection("High Cube Teleop")}, ${collection("High Cone Teleop")}, ${collection("High Miss Teleop")}, ";

    // Timers
    info = info +
        "${collection("Opponent 1")}, ${collection("TimeInfo1")}, ${collection("Opponent 2")}, ";
    info = info +
        "${collection("TimeInfo2").toString()}, ${collection("Opponent 3").toString()}, ${collection("TimeInfo3").toString()}, ";

    // Charging Station
    info = info +
        "$thing, ${collection("TimeInfo4")}, $thing, $docked, $engaged, $fell, ";

    // Post Match Info
    info = info +
        "${collection("Foul Points").toString()}, $yellow, $red, $brokedown, $repaired";

    return info;
  }

  void getFile(List<List<dynamic>> getInfos) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = new File(dir + "/filename.csv");

    String csv = const ListToCsvConverter().convert(getInfos);
    f.writeAsString(csv);
    print("done");
  }

  formCsv(String input) async {
    List<String> splitted = input.split('~');
    late List<List<dynamic>> totall = [];
    for (String x in splitted) {
      List<String> row = x.split(', ');
      totall.add(row);
    }
    String dir =
        (await getApplicationDocumentsDirectory()).path + "/filename.csv";

    getFile(totall);
    Share.shareFiles(['$dir'], text: 'Robotics Csv File');
  }

  String MatchInfo() {
    String total = "";

    for (String i in queue) {
      total = total + i.toString();
    }

    queue = Set();

    return total;
  }
}
