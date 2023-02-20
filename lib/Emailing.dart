import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:frc_2023_charged_up_scouting/Functions.dart';

class emailing extends StatefulWidget {
  const emailing({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<emailing> createState() => _emailingState();
}

class _emailingState extends State<emailing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Convert This')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  functions.instance.Dataclass
                      .formCsv(functions.instance.Dataclass.MatchInfo());
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
