import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappforstud/screens/Welcome/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'constants.dart';

Future<void> main() async {
  runApp(MyApp());

  AmapService amapService=  AmapService.instance;

  await amapService.init(
    androidKey: '9f8df13b7f208099cc2fef162949fd7f',
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return   OKToast(
        child:  MaterialApp(//  what is MateialAPP
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange, //主题颜色样本，
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light  , //深色还是浅色 默认浅色
//        Color primaryColor, //主色，决定导航栏颜色
//        Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
//        Color cardColor, //卡片颜色
//        Color dividerColor, //分割线颜色
//         buttonTheme:  ButtonThemeData(disabledColor: Colors.grey ), //按钮主题
//        Color cursorColor, //输入框光标颜色
//        Color dialogBackgroundColor,//对话框背景颜色
//        String fontFamily, //文字字体
//        TextTheme textTheme,// 字体主题，包括标题、body等文字样式
//        IconThemeData iconTheme, // Icon的默认样式
//        TargetPlatform platform, //指定平台，应用特定平台控件风格
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Yi APP ',
      home:    WelcomeScreen()
    ));
  }

}
