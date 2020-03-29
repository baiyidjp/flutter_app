import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {

  static final route = "/detail";

  final _message;

  HomeDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {

        Navigator.of(context).pop("详情点击返回按钮的数据");

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('详情'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("详情数据：$_message"),
              RaisedButton(
                child: Text('返回'),
                onPressed: () {
                  Navigator.of(context).pop("详情的数据");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
