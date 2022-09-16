import 'package:flutter/material.dart';

class InitialApp extends StatefulWidget {
  InitialApp({Key key}) : super(key: key);

  @override
  State<InitialApp> createState() => _InitialAppState();
}

class _InitialAppState extends State<InitialApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InitialApp"),
      ),
      body: Center(
        child: Text("Initial App"),
      ),
    );
  }
}