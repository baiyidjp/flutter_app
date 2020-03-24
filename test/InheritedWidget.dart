import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidget'),
        ),
        body: HomeCounterPage(
          counter: _counter,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HomeDataPage1(),
                HomeDataPage2()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
      ),
    );
  }
}

class HomeCounterPage extends InheritedWidget {

  // 定义状态的数据
  final int counter;

  // 构造方法 将状态从依赖的Widget中传入
  HomeCounterPage({this.counter, Widget child}) : super(child: child);

  static HomeCounterPage of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(HomeCounterPage oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.counter != counter;
  }
}

class HomeDataPage1 extends StatefulWidget {
  @override
  _HomeDataPage1State createState() => _HomeDataPage1State();
}

class _HomeDataPage1State extends State<HomeDataPage1> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    int counter = HomeCounterPage.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text('当前计数：$counter', style: TextStyle(fontSize: 30, color: Colors.white),),
    );
  }
}

class HomeDataPage2 extends StatefulWidget {
  @override
  _HomeDataPage2State createState() => _HomeDataPage2State();
}

class _HomeDataPage2State extends State<HomeDataPage2> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    int counter = HomeCounterPage.of(context).counter;

    return Container(
      color: Colors.purple,
      child: Text('当前计数：$counter', style: TextStyle(fontSize: 30, color: Colors.white),),
    );
  }
}



