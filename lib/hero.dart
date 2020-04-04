import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {

  final String _imageURL;

  HeroPage(this._imageURL);

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: widget._imageURL,
            child: Image.network(widget._imageURL, fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}