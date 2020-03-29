import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

  static final route = "/error";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误❎"),
      ),
      body: Center(
        child: Text("错误❎"),
      ),
    );
  }
}
