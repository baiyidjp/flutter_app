import 'package:flutter/material.dart';

class FadePage extends StatefulWidget {
  @override
  _FadePageState createState() => _FadePageState();
}

class _FadePageState extends State<FadePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text("Fade"),
      ),
    );
  }
}
