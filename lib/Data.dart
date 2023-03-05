import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Endgame.dart';
import 'dart:async';
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


  Map<String, dynamic> data = {"Color Red" : false,
              "Color Blue" : false,
              "Team Number" : "0",
              "Match Number": "0",
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
              "Hybrid Teleop" : 0,
              "Middle Cube Teleop": 0,
              "Middle Cone Teleop" : 0,
              "Middle Miss Teleop" : 0,
              "High Cube Teleop": 0,
              "High Cone Teleop" : 0,
              "High Miss Teleop" : 0,

              // Defense
              "Opponent 1": "0",
              "Opponent 2": "0",
              "Opponent 3": "0",
              "Charge Station": "0",



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
              "Fell" : false,
              "Yellow Card": false,
              "Red Card": false,
              "Brokedown Card": false,
              "Repaired Card": false,
              "Foul Points": 0,
              "Docked Teleop": false,
              "Engaged Teleop" : false,

              //Scanner
              "Scanner1" : "",
              "Scanner2" : "",
              "Scanner3" : "",
              "Scanner4" : "",
              "Scanner5" : "",
              "Scanner6" : "",
              "change222":false
  };

  void TimerSetter(String presses, Object? time, String TimeInfo, Object? StopWatch) async {

    if ((functions.instance.Dataclass.data[presses] as bool)) {

        (functions.instance.Dataclass.data[StopWatch] as Stopwatch).start();
        functions.instance.Dataclass.data[time.toString()] = (functions.instance.Dataclass.data[time.toString()] == "On ") ? "Not on ": "On ";
        functions.instance.Dataclass.data[TimeInfo] = (functions.instance.Dataclass.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000;
        functions.instance.Dataclass.data[presses] = false;

    } else {

        (functions.instance.Dataclass.data[StopWatch] as Stopwatch).stop();
        functions.instance.Dataclass.data[time.toString()] = (functions.instance.Dataclass.data[time.toString()] == "Not on ") ? "On ": "Not on ";

        functions.instance.Dataclass.data[TimeInfo] = (functions.instance.Dataclass.data[StopWatch] as Stopwatch).elapsedMilliseconds/1000;
        functions.instance.Dataclass.data[presses] = true;

    }


  }
  bool scannerCheck(String result, int number) {
    String result1 = this.data["Scanner1"];
    String result2 = this.data["Scanner2"];
    String result3 = this.data["Scanner3"];
    String result4 = this.data["Scanner4"];
    String result5 = this.data["Scanner5"];
    String result6 = this.data["Scanner6"];
    List<String> results = [result1, result2, result3, result4, result5, result6];
    for(int i = 0; i < 6; i++){
      if(i != number){
        if(results[i] == result){
          return false;
        }
      }
    }
    if (result == ""){
      return false;
    }
    return true;
  }
  String evaluvateData(){
    var moved = functions.instance.Dataclass.data["Moved"]==true ? "1" : "0";
    var docked = functions.instance.Dataclass.data["Docked"]==true ? "1" : "0";
    var engaged = functions.instance.Dataclass.data["Engaged"]==true ? "1" : "0";
    var thing = functions.instance.Dataclass.data["Docked"]=true ? "1" : "0";
    if(functions.instance.Dataclass.data["Docked"] || functions.instance.Dataclass.data["Engaged"])  {
      thing="1";
    }
    var yellow = functions.instance.Dataclass.data["Yellow Card"]==true ? "1" : "0";
    var red = functions.instance.Dataclass.data["Red Card"]==true ? "1" : "0";
    var brokedown = functions.instance.Dataclass.data["Brokedown Card"]==true ? "1" : "0";
    var repaired = functions.instance.Dataclass.data["Repaired Card"]==true ? "1" : "0";
    var fell = functions.instance.Dataclass.data["Fell"]==true? "1" : "0";
    var charge = functions.instance.Dataclass.data["Charge Station"]==true? "1" : "0";
    
    var color = functions.instance.Dataclass.data["Colour"].toString()=="Colour" ? "Red" : functions.instance.Dataclass.data["Colour"].toString();

    // Pre Match Info
    String info = "${functions.instance.Dataclass.data["Team Number"]}, ${functions.instance.Dataclass.data["Match Number"]}, $color, ";

    // Autonomous
    info = info + "$moved, ${functions.instance.Dataclass.data["Hybrid"]}, ${functions.instance.Dataclass.data["Middle Cube"]}, ${functions.instance.Dataclass.data["Middle Cone"]}, ${functions.instance.Dataclass.data["High Cube"]}, ${functions.instance.Dataclass.data["High Cone"]}, $thing, ";
    info = info + "$docked, $engaged, $charge, ";

    // Teleop
    info = info + "${functions.instance.Dataclass.data["Hybrid Teleop"]}, ";
    info = info + "${functions.instance.Dataclass.data["Middle Cube Teleop"]}, ${functions.instance.Dataclass.data["Middle Cone Teleop"]}, ${functions.instance.Dataclass.data["Middle Miss Teleop"]}, ${functions.instance.Dataclass.data["High Cube Teleop"]}, ${functions.instance.Dataclass.data["High Cone Teleop"]}, ${functions.instance.Dataclass.data["High Miss Teleop"]}, ";

    // Timers
    info = info + "${functions.instance.Dataclass.data["Opponent 1"]}, ${functions.instance.Dataclass.data["TimeInfo1"]}, ${functions.instance.Dataclass.data["Opponent 2"]}, ";
    info = info + "${functions.instance.Dataclass.data["TimeInfo2"].toString()}, ${functions.instance.Dataclass.data["Opponent 3"].toString()}, ${functions.instance.Dataclass.data["TimeInfo3"].toString()}, ";

    // Charging Station
    info = info + "$thing, ${functions.instance.Dataclass.data["TimeInfo4"]}, $thing, $docked, $engaged, $fell, ";

    // Post Match Info
    info = info + "${functions.instance.Dataclass.data["Foul Points"].toString()}, $yellow, $red, $brokedown, $repaired";
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
    List<String> splitted = input.split('~'); // change to ~
    late List<List<dynamic>> totall = [];
    for (String x in splitted) {
      List<String> row = x.split(', ');
      totall.add(row);
    }
    String dir = (await getApplicationDocumentsDirectory()).path + "/filename.csv";

    getFile(totall);
    //(['${directory.path}/image.jpg'], text: 'Great picture');
    Share.shareFiles(['$dir'], text: 'Robotics Csv File');

  }



  sendEmail() async {
    String thing = (await getApplicationDocumentsDirectory()).path + "/filename.csv";
    final Email send_email = Email(
      body: '',
      subject: 'Scouting Info',
      recipients: ['4976scouting@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [thing],
      isHTML: false,
    );

    await FlutterEmailSender.send(send_email);
  }
  String MatchInfo() {
    String result1 = this.data["Scanner1"];
    String result2 = this.data["Scanner2"];
    String result3 = this.data["Scanner3"];
    String result4 = this.data["Scanner4"];
    String result5 = this.data["Scanner5"];
    String result6 = this.data["Scanner6"];
    return result1+result2+result3+result4+result5+result6;
  }
}

