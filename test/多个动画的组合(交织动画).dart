import 'dart:math';

import 'package:flutter/material.dart';

// 参考链接  https://mp.weixin.qq.com/s/K1yOOTIYEzB2N7tIJv5jtQ

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeBodyPage(),
    );
  }
}

class HomeBodyPage extends StatefulWidget {

  @override
  _HomeBodyPageState createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  Animation _sizeAnimation;
  Animation _colorAnimation;
  Animation _opacityAnimation;
  Animation _rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    // 有的Tween不支持Curves的个别属性
    _sizeAnimation = Tween(begin: 100.0, end: 200.0).animate(_controller);
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.pink).animate(_controller);
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _rotationAnimation= Tween(begin: 0.0, end: 2*pi).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("HomeBodyPage build");
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform(
                  transform: Matrix4.rotationZ(_rotationAnimation.value),
                  // 旋转点
                  alignment: Alignment.center,
                  child: Container(
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    color: _colorAnimation.value,
//            transform: Matrix4.rotationZ(pi/4), // 左上角为中心旋转
                  ),
                ),
              );
            },
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

class AnimationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("AnimationText Build");
    return Text("动画标题,不会重新build");
  }
}
