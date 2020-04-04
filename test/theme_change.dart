import 'package:flutter/material.dart';

class ChangeThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemePage();
  }
}

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.deepOrange,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.red)
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("改变主题"),
        ),
        body: Center(
          child: Text("主题色"),
        ),
        /* floatingActionButton改变主题跟其他不一样 */
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: Colors.pinkAccent
            )
          ),
          child: FloatingActionButton(
            child: Icon(Icons.favorite),
          ),
        ),
      ),
    );
  }
}

