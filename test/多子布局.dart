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
        title: Text("多子布局 Widget"),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  bool _isSelected = false;
  final _normalColor = Colors.white;
  final _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("static/images/demo.jpg"),
        // Positioned 专门用在Stack中 用来调节Widget的布局
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("我是一个图片的标题", style: TextStyle(fontSize: 20, color: Colors.white)),
                GestureDetector(
                  child: Icon(Icons.favorite, color: _isSelected ? _selectedColor : _normalColor),
                  onTapDown: (details) {
                    print(details.localPosition);
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },)
              ],
            ),
            color: Color.fromARGB(100, 0, 0, 0),
            padding: EdgeInsets.all(10),
          ),
        )
      ],
    );
  }

  Row buildRow() {
    return Row(
      // 主轴
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // 交叉轴
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Expanded 设置拉伸和缩放 具体的是根据 flex 的值进行
        Expanded(
          child: Container(width: 200, height: 30, color: Colors.red),
          flex: 2,
        ),
        Expanded(
          child: Container(width: 240, height: 120, color: Colors.green),
          flex: 1,
        ),
        Container(width: 120, height: 80, color: Colors.blue),
        Container(width: 50, height: 40, color: Colors.black)
      ],
    );
  }
}
