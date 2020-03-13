import 'dart:math';

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
        title: Text("列表滚动监听"),
      ),
      body: HomeBody(),
      floatingActionButton: isShowFloatingButton ? FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          controller.animateTo(0, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
        },
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

ScrollController controller = ScrollController(initialScrollOffset: 0);
bool isShowFloatingButton = false;

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
//      print("监听到滚动--${controller.offset}");
      setState(() {
        isShowFloatingButton = (controller.offset >= 1000);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {

        if (notification is ScrollStartNotification) {
          print("监听到开始滚动");
        } else if (notification is ScrollUpdateNotification) {
          print("监听到正在滚动 总滚动范围: ${notification.metrics.maxScrollExtent} 当前滚动: ${notification.metrics.pixels}");
        } else if (notification is ScrollEndNotification) {
          print("监听到结束滚动");
        }
        return true;
      },
      child: ListView.builder(
        itemCount: 100,
        controller: controller,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text("联系人-$index"),
            ),
          );
        },
      ),
    );
  }
}
