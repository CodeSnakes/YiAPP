//这是HomeView类的控制页
import 'package:flutter/material.dart';

class BusinessView extends StatefulWidget {//新建导航页面
  BusinessView({Key key}) : super(key: key);
  @override
  _BusinessViewState createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Text(
            "MapsView",
            style: optionStyle,
          ),
        ),
      ),
    );
  }
}
