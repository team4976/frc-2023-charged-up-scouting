import 'package:flutter/material.dart';

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
       ])
    );
  }
}

