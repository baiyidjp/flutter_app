import 'package:flutter/material.dart';
import '../lib/detail.dart';
import '../lib/about.dart';
import '../lib/error.dart';

// 参考链接  https://mp.weixin.qq.com/s/K1yOOTIYEzB2N7tIJv5jtQ

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: HomeBodyPage(),
        routes: {
          HomeBodyPage.route : (context) => HomeBodyPage(),
          HomeAboutPage.route : (context) => HomeAboutPage()
        },
        // 有了initialRoute就不需要设置home了
        initialRoute: HomeBodyPage.route,
        // 使用命名路由跳转带入参的页面
        onGenerateRoute: (settings) {
          if (settings.name == HomeDetailPage.route) {
            return MaterialPageRoute(
                builder: (context) {
                  return HomeDetailPage(settings.arguments);
                }
            );
          }
          return null;
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (context) {
                return ErrorPage();
              }
          );
        }

    );
  }
}

class HomeBodyPage extends StatefulWidget {

  static final route = "/home";

  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {

  String _message = "默认";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('路由'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message, style: TextStyle(fontSize: 20)),
              RaisedButton(
                  child: Text("跳转详情"),
                  onPressed: () => _jumpDetail(context)
              ),
              RaisedButton(
                  child: Text("跳转关于"),
                  onPressed: () => _jumpAbout(context)
              ),
              RaisedButton(
                  child: Text("跳转未知"),
                  onPressed: () => _jumpUnknown(context)
              ),
            ],
          ),
        )
    );
  }

  void _jumpDetail(BuildContext context) {
//    Navigator.push(context, MaterialPageRoute(
//      builder: (context) {
//        return HomeDetailPage('首页的数据');
//      }
//    )).then((res) {
//      setState(() {
//        _message = (res as String);
//      });
//    });

    Navigator.pushNamed(context, HomeDetailPage.route, arguments: "命名路由的入参").then((res) {
      setState(() {
        _message = (res as String);
      });
    });
  }

  void _jumpAbout(BuildContext context) {
    Navigator.pushNamed(context, HomeAboutPage.route, arguments: "首页的数据").then((res) {
      print("About Data $res");
    });
  }

  void _jumpUnknown(BuildContext context) {
    Navigator.of(context).pushNamed(ErrorPage.route);
  }
}
