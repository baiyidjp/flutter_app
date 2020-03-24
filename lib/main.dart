import 'package:flutter/material.dart';
import 'package:flutter_app/store/user_info_store.dart';
import 'package:provider/provider.dart';
import 'store/app_providers.dart';
import 'store/counter_store.dart';

//参考：https://mp.weixin.qq.com/s/ywGQnaYpioPxlYvYTSpR4w

main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              HomeDataPage1(),
              HomeDataPage2(),
              HomeDataPage3()
            ],
          ),
        ),
        // 使用Selector操作数据
        floatingActionButton: Selector<CounterStore, CounterStore>(
          selector: (context, counterStore) => counterStore,
          shouldRebuild: (pre, next) => false,
          builder: (context, counterStore, child) {
            print('Selector builder');
            // 这里传的child是下面的child
            return FloatingActionButton(
              child: child,
              onPressed: () {
                counterStore.count += 1;
              },
            );
          },
          child: Icon(Icons.add),
        )
      ),
    );
  }
}


class HomeDataPage1 extends StatefulWidget {
  @override
  _HomeDataPage1State createState() => _HomeDataPage1State();
}

class _HomeDataPage1State extends State<HomeDataPage1> {

  @override
  Widget build(BuildContext context) {

    // 第一种使用全局状态的 of
    int _count = Provider.of<CounterStore>(context).count;
    print('of build');
    return Card(
      color: Colors.red,
      child: Text('当前计数：$_count', style: TextStyle(fontSize: 30, color: Colors.white),),
    );
  }
}

class HomeDataPage2 extends StatefulWidget {
  @override
  _HomeDataPage2State createState() => _HomeDataPage2State();
}

class _HomeDataPage2State extends State<HomeDataPage2> {

  @override
  Widget build(BuildContext context) {

    print('Consumer build');

    return Consumer<CounterStore>(
      builder: (context, counterStore, child) {
        print('Consumer builder');
        return Container(
          color: Colors.purple,
          child: Text('当前计数：${counterStore.count}', style: TextStyle(fontSize: 30, color: Colors.white),),
        );
      },
    );
  }
}

class HomeDataPage3 extends StatefulWidget {
  @override
  _HomeDataPage3State createState() => _HomeDataPage3State();
}

class _HomeDataPage3State extends State<HomeDataPage3> {

  @override
  Widget build(BuildContext context) {

    return Consumer2<CounterStore, UserInfoStore>(
      builder: (context, counterStore, userInfoStore, child) {
        return Container(
          color: Colors.blue,
          child: Text('当前计数: ${counterStore.count} 年龄：${userInfoStore.userInfoModel.age} 身高：${userInfoStore.userInfoModel.height}', style: TextStyle(fontSize: 30, color: Colors.white),),
        );
      },
    );
  }
}



