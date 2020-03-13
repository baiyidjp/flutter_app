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
//      appBar: AppBar(
//        title: Text("ListView/GridView Widget"),
//      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Sliver AppBar", style: TextStyle(fontSize: 20, color: Colors.black),),
          // 扩展高度
          expandedHeight: 200,
          backgroundColor: Colors.tealAccent,
//          flexibleSpace: Image(
//            image: AssetImage("static/images/demo.jpg"),
//            fit: BoxFit.cover,
//          ),
          // 滚动到屏幕外，导航停留在顶部
          pinned: true,
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.3),
          delegate:
          SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          }, childCount: 8),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(256),
                    Random().nextInt(256), Random().nextInt(256)),
                child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人-$index"),
                ),
              );
            },
            childCount: 30,
          ),
        ),
      ],
    );
  }

  Padding gridViewBuilder() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) {
          print("current index: $index");
          return Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Text("${index + 1}",
                    style: TextStyle(fontSize: 20, color: Colors.blue))
              ],
            ),
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        },
        itemCount: 100,
      ),
    );
  }

  GridView buildGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 交叉轴的个数
          crossAxisSpacing: 10, // 交叉轴 item 的间距
          mainAxisSpacing: 5, // 主轴方向的 item 的间距
          childAspectRatio: 9 / 10 // 宽高比
      ),
      children: List.generate(100, (index) {
        return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)));
      }),
    );
  }

  ListView buildSeparatedListView() {
    return ListView.separated(
      // 下划线的item
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: Text("带下划线的 Hello World $index",
                style: TextStyle(fontSize: 20)));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.purple,
          height: 20,
          // 线所占据的空间高度 不是线的高度
          thickness: 1,
          // 线的实际高度
          indent: 20,
          //左边的间距
          endIndent: 50, // 右边的间距
        );
      },
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 30, // item 高度
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: Text("Hello World $index", style: TextStyle(fontSize: 20)));
      },
    );
  }

  ListView baseBuildListView() {
    return ListView(
      // 每次都是创建 固定个数的item，不建议在很多item的时候使用，性能不好
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title:
          Text("董江鹏", style: TextStyle(fontSize: 20, color: Colors.black)),
          subtitle: Text("介绍信息 $index",
              style: TextStyle(fontSize: 15, color: Colors.grey)),
        );
//        return Text("Hello World $index");
      }),
    );
  }
}
