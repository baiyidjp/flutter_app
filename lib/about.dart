import 'package:flutter/material.dart';

class HomeAboutPage extends StatelessWidget {

  static final route = "/about";

  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("关于数据 $message"),
            RaisedButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.of(context).pop("关于的数据");
              },
            )
          ],
        ),
      ),
    );
  }
}
