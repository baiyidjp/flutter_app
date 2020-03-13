import 'package:flutter/material.dart';

//main() {
//  // 1. runApp 函数 启动app
//  runApp(MyApp());
//}

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage()
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: MainBodyPage()
    );
  }
}
//
//class MainBodyPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Center(
//      child: Text(
//        "Hello World",
//        style: TextStyle(
//            fontSize: 30,
//            color: Colors.red
//        ),
//      ),
//    );
//  }
//}

class MainBodyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainBodyPageState();
  }
}

class MainBodyPageState extends State<MainBodyPage> {

  var flag = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: flag,
            onChanged: (value) {
              setState(() {
                flag = value;
              });
            },
          ),
          Text("同意协议", style: TextStyle(fontSize: 20, color: Colors.orange))
        ],
      ),
    );
  }
}