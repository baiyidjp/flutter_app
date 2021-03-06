import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///Users/dong/Desktop/Flutter/flutter_app/test/theme_change.dart';
import 'package:flutter_app/layout/layout.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Layout.init();

    return MaterialApp(
      home: HomeBodyPage(),
      theme: ThemeData(
        // 设置是否是暗黑模式
        brightness: Brightness.light,
        /* 导航栏背景色和TabBar的选中色 */
        primarySwatch: Colors.purple,
//        primaryColor: Color(0xfffafafa),
        /* FloatingButton 和 Switch 等的默认背景色*/
        accentColor: Colors.lightBlueAccent,
        buttonTheme: ButtonThemeData(
          height: 10,
          minWidth: 10,
          buttonColor: Colors.greenAccent,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        )
      ),
      darkTheme: ThemeData(
        /* 导航栏背景色和TabBar的选中色 */
          primarySwatch: Colors.grey,
//        primaryColor: Color(0xfffafafa),
          /* FloatingButton 和 Switch 等的默认背景色*/
          accentColor: Colors.black12,
          buttonTheme: ButtonThemeData(
            height: 10,
            minWidth: 10,
            buttonColor: Colors.blueGrey,
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
            CupertinoSwitch(value: true, onChanged: (value) {

            }),
            RaisedButton(
              child: Text("Button"),
              onPressed: () {},
            ),
            Container(
              width: 200.pt,
              height: 200.pt,
              color: Colors.red,
            ),
            Text("width: ${200.pt}  height: ${200.pt}")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ChangeThemePage();
            }
          ));
        },
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

