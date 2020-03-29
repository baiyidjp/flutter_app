import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeBodyPage(),
    );
  }
}

class HomeBodyPage extends StatefulWidget {
  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('事件'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                ),
                onTapDown: (detail) {
                  print('点击按下');
                },
                onTapUp: (detail) {
                  print('点击抬起');
                },
                onTapCancel: () {
                  print('取消点击');
                },
                onTap: () {
                  print('点击完成');
                },
                onDoubleTap: () {
                  print('双击');
                },
              )
            ],
          ),
        )
    );
  }
}
