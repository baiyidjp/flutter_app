import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeBodyPage(),
      theme: ThemeData(
        // 设置是否是暗黑模式
          brightness: Brightness.light,
          /* 导航栏背景色和TabBar的选中色 */
          primarySwatch: Colors.purple,
          /* FloatingButton 和 Switch 等的默认背景色*/
          accentColor: Colors.lightBlueAccent,
          buttonTheme: ButtonThemeData(
            height: 10,
            minWidth: 10,
            buttonColor: Colors.greenAccent,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          )
      ),
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
        title: Text("主题Theme"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("主题Theme"),
            Switch(
              value: true,
              onChanged: (value) {},
            ),
            /* iOS Switch  */
            CupertinoSwitch(value: true, onChanged: (value) {}),
            RaisedButton(
              child: Text("Button"),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text("菜单")
          )
        ],

      ),
    );
  }
}

