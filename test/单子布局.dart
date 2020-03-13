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
        title: Text("单子布局 Widget"),
      ),
      body: HomeBodyPage(),
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
    return buildCenterContainer();
  }

  Center buildCenterContainer() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
//        color: Colors.purple,
        child: Icon(Icons.pets, color: Colors.white, size: 50),
        decoration: BoxDecoration(
            color: Colors.purple,
            // 边框
            border: Border.all(
                width: 1,
                color: Colors.green,
                style: BorderStyle.solid
            ),
            // 圆角
            borderRadius: BorderRadius.circular(10),
            // 阴影
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.blue,
                  blurRadius: 5
              )
            ],
            // 可以实现圆角图片的展示
            image: DecorationImage(
                image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583749706794&di=ba7bab4772f133c1289c06a91de80517&imgtype=0&src=http%3A%2F%2Ft8.baidu.com%2Fit%2Fu%3D1484500186%2C1503043093%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D853'),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }

  /*
//          border: Border(
        // 设置单边的边框
//            top: BorderSide(
//              color: Colors.red,
//              width: 10,
//              style: BorderStyle.solid
//            )
//          )
  *
  * */

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildContainerAlign(),
    );
  }

  Container buildContainerAlign() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Align(
        child: Text("我是被Container包裹的Align,可以设置宽高", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Align buildBaseAlign() {
    return Align(
      child: Text("我是Align Widget", style: TextStyle(fontSize: 20)),
//      alignment: Alignment.centerLeft,
      alignment: Alignment(0, 0.5),
    );
  }
}




