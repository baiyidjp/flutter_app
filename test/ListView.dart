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
          title: Text('ListView')
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProductItem("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(height: 8),
        ProductItem("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(height: 8),
        ProductItem("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        SizedBox(height: 8),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {

  final String title;
  final String desc;
  final String imageUrl;

  final titleStyle = TextStyle(fontSize: 25, color: Colors.purple);
  final descStyle = TextStyle(fontSize: 20, color: Colors.grey);

  ProductItem(this.title, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 设置边框，内间距使用 Container
      padding: EdgeInsets.all(3), // 设置内边距
      // 设置边框
      decoration: BoxDecoration(
          border: Border.all(
              width: 3,
              color: Colors.red
          )
      ),
      child: Column(
        // 控制交叉轴的位置
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 设置间距 使用 SizedBox
          SizedBox(height: 8),
          Text(title, style: titleStyle),
          SizedBox(height: 8),
          Text(desc, style: descStyle),
          SizedBox(height: 8),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}

//class ProductItem extends StatelessWidget {
//
//  final String title;
//  final String desc;
//  final String imageUrl;
//
//  final titleStyle = TextStyle(fontSize: 25, color: Colors.purple);
//  final descStyle = TextStyle(fontSize: 20, color: Colors.grey);
//
//  ProductItem(this.title, this.desc, this.imageUrl);
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        // 设置间距 使用 SizedBox
//        SizedBox(height: 8),
//        Text(title, style: titleStyle),
//        SizedBox(height: 8),
//        Text(desc, style: descStyle),
//        SizedBox(height: 8),
//        Image.network(imageUrl)
//      ],
//    );
//  }
//}




