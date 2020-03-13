import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('计数器Demo')
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomeContent('哈哈哈哈'),
    );
  }
}

class HomeContent extends StatefulWidget {

  // fulWidget接受外部参数
  final String message;

  HomeContent(this.message);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getButtons(),
        Text('当前计数：$_counter', style: TextStyle(fontSize: 25)),
        Text('外部参数：${widget.message}')
      ],
    );
  }

  // 封装一个方法 获取buttons
  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text('+', style: TextStyle(fontSize: 25, color: Colors.white)),
          color: Colors.purple,
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        SizedBox(width: 3),
        RaisedButton(
          child: Text('-', style: TextStyle(fontSize: 25, color: Colors.white)),
          color: Colors.purple,
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
        )
      ],
    );
  }
}





