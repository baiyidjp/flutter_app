import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _sizeAnimation = Tween(begin: 50.0, end: 100.0).animate(_animation);

    // 影响性能 每次都要重新执行build方法
//    _controller.addListener(() {
//      setState(() {
//
//      });
//    });

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
              // 只会重新构建return的widget中除了child的widgets
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite, color: Colors.red, size: _sizeAnimation.value,),
                    child
                  ],
                );
              },
              child: AnimationText()
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
