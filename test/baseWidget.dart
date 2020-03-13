import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础Widget'),
      ),
      body: ContentPage(),
      // 设置全局的可点击的按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        baseTextField(),
        baseImage(),
        baseButton(),
        baseText()
      ],
    );
  }

  Widget baseText() {
    return Column(
      children: <Widget>[
        Text('基础的TextWidget', style: TextStyle(fontSize: 20, color: Colors.purple)),
        Text(
            '超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text,超长的Text',
            textAlign: TextAlign.center,// 居中
            maxLines: 3, // 最大行数
            overflow: TextOverflow.ellipsis, // 超出...显示
            style: TextStyle(
                fontSize: 20,
                color: Colors.blue
            )
        ),
        Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '东风破 ', style: TextStyle(fontSize: 25, color: Colors.red)),
                  TextSpan(text: ' 周杰伦', style: TextStyle(fontSize: 20, color: Colors.blue)),
                  TextSpan(text: '\n一盏离愁 孤单伫立在窗口\n我在门后 假装你人还没走\n旧地如重游 月圆更寂寞\n夜半清醒的烛火 不忍苛责我\n一壶漂泊 浪迹天涯难入喉\n你走之后 酒暖回忆思念瘦\n水向东流 时间怎么偷')
                ]
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey)
        )
      ],
    );
  }

  Widget baseButton() {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('RaisedButton'),
          color: Colors.red,
          textColor: Colors.white,
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // 默认的大小 （48*48）
          onPressed: () {
            print('RaisedButton Clicked');
          },
        ),
        FlatButton(
          child: Text('FlatButton'),
          textColor: Colors.purple,
          color: Colors.blue,
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            print('FlatButton Clicked');
          },
        ),
        OutlineButton(
          child: Text('OutlineButton'),
          textColor: Colors.lightGreen,
          color: Colors.purple,
          borderSide: BorderSide(
              color: Colors.purple,
              width: 1,
              style: BorderStyle.solid
          ),
          onPressed: () {
            print('OutlineButton Clicked');
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.add, color: Colors.purple),
          backgroundColor: Colors.yellowAccent,
          onPressed: () {
            print('FloatingAction Clicked');
          },
        ),
        RaisedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.cached),
              Text('自定义刷新Button'),
            ],
          ),
          textColor: Colors.white, // 文字颜色
          color: Colors.purple, // 按钮背景色
          highlightColor: Colors.deepPurple, // 高亮
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          onPressed: () {
            print('自定义按钮的点击');
          },
        ),
        ButtonTheme(
          minWidth: 30,
          height: 20,
          child: RaisedButton(
            child: Text('最小宽高的自定义', style: TextStyle(fontSize: 10),),
            color: Colors.red,
            textColor: Colors.white,
            padding: EdgeInsets.all(0), // 取消内边距
            onPressed: () {
              print('RaisedButton Clicked');
            },
          ),
        ),
      ],
    );
  }

  Widget baseImage() {
    return Column(
      children: <Widget>[
        Text('占位图'),
        FadeInImage(
          placeholder: AssetImage('static/images/demo.jpg'),
          image: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583749706794&di=ba7bab4772f133c1289c06a91de80517&imgtype=0&src=http%3A%2F%2Ft8.baidu.com%2Fit%2Fu%3D1484500186%2C1503043093%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D853'),
        ),
        Text('网络图片'),
        Container(
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583749706794&di=ba7bab4772f133c1289c06a91de80517&imgtype=0&src=http%3A%2F%2Ft8.baidu.com%2Fit%2Fu%3D1484500186%2C1503043093%26fm%3D79%26app%3D86%26f%3DJPEG%3Fw%3D1280%26h%3D853',
          ),
          height: 200,
        ),
        Text('本地图片'),
        Container(
          height: 200,
          child: Image.asset('static/images/demo.jpg'),
//          child: Image(
//            image: AssetImage('assets/images/demo.png'),
//          )
        ),
        Text('圆角图片'),
        CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('static/images/demo.jpg'),
        ),
        SizedBox(height: 8)
      ],
    );
  }

  Widget baseTextField() {

    // 获取text
    final mobileController = TextEditingController();
    final smsController = TextEditingController();
    // 获取/失去 焦点
    final mobileFocusNode = FocusNode();
    final smsFocusNode = FocusNode();

    return Column(
      children: <Widget>[
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            ButtonTheme(
              minWidth: 80,
              height: 40,
              child: FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Row(
                  children: <Widget>[
                    Text("+ 86"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                color: Color(0xFFD8D8D8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                onPressed: () {

                },
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                child: TextField(
                  focusNode: mobileFocusNode,
                  controller: mobileController,
                  decoration: InputDecoration(
                      hintText: "请输入手机号",
                      filled: true,
                      fillColor: Color(0xFFD8D8D8),
                      border: InputBorder.none
                  ),
                  onChanged: (value) {

                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 40,
                child: TextField(
                  focusNode: smsFocusNode,
                  controller: smsController,
                  decoration: InputDecoration(
                      hintText: "请输入验证码",
                      filled: true,
                      fillColor: Color(0xFFD8D8D8),
                      border: InputBorder.none
                  ),
                  onChanged: (value) {

                  },
                ),
              ),
            ),
            SizedBox(width: 8),
            ButtonTheme(
              minWidth: 80,
              height: 40,
              child: FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Text("发送验证码"),
                color: Color(0xFFD8D8D8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                onPressed: () {

                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 40,
          child: RaisedButton(
            child: Text("登录"),
            textColor: Colors.white,
            color: Color(0xFF5A2B81),
            onPressed: () {
              final mobile = mobileController.text;
              final sms = smsController.text;
              print("手机号: $mobile\n验证码: $sms");
              mobileController.text = "";
              smsController.text = "";
              mobileFocusNode.unfocus();
              smsFocusNode.unfocus();
            },
          ),
        )
      ],
    );
  }
}




