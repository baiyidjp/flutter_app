import 'package:flutter/material.dart';
import 'package:flutter_app/hero.dart';

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

class _HomeBodyPageState extends State<HomeBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查看大图"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 16/9
        ),
        children: List.generate(20, (index){
          final imageURL= "https://picsum.photos/800/450?random=$index";
          return GestureDetector(
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2){
                    return FadeTransition(
                      opacity: animation1,
                      child: HeroPage(imageURL),
                    );
                  }
              ));
            },
            child: Hero(
              tag: imageURL,
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageURL),
                placeholder: AssetImage("assets/img/default.png"),
              ),
            ),
          );
        }),
      ),
    );
  }
}

