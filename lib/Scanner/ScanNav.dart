import 'package:flutter/material.dart';
import 'package:frc_2023_charged_up_scouting/Functions.dart';

class scanPage extends StatefulWidget {
  const scanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<scanPage> createState() => _scanPageState();
}

class _scanPageState extends State<scanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){functions.instance.GotoPage("/Scanner1", context);}, child: const Text("Scan Another Code")),
            ElevatedButton(onPressed: (){functions.instance.GotoPage("/EmailingPage", context);}, child: const Text("Send the Information")),
            ElevatedButton(onPressed: (){functions.instance.Dataclass.refreshSet();}, child: const Text("EmptyList")),
          ],
        ),
      )
    );
  }
}
