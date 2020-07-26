import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappforstud/pages/Home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(//  what is MateialAPP
      theme: ThemeData(
        primarySwatch: Colors.orange, //主题颜色样本，
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light  , //深色还是浅色 默认浅色
//        Color primaryColor, //主色，决定导航栏颜色
//        Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
//        Color cardColor, //卡片颜色
//        Color dividerColor, //分割线颜色
         buttonTheme:  ButtonThemeData(disabledColor: Colors.grey ), //按钮主题
//        Color cursorColor, //输入框光标颜色
//        Color dialogBackgroundColor,//对话框背景颜色
//        String fontFamily, //文字字体
//        TextTheme textTheme,// 字体主题，包括标题、body等文字样式
//        IconThemeData iconTheme, // Icon的默认样式
//        TargetPlatform platform, //指定平台，应用特定平台控件风格
      ),
      title: 'Flutter Bank Demo',
      home: HomeView(),
    );
  }
}
