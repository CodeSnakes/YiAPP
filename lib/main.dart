import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterappforstud/mode/habit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  what is MateialAPP
      title: 'Flutter Bank',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //爱好卡片列表信息
  var habits = [
    HabitModel(icon: "shopping_icon.png", lable: "Shopping"),
    HabitModel(icon: "travel_icon.png", lable: "Travel"),
    HabitModel(icon: "health_icon.png", lable: "Health"),
    HabitModel(icon: "food_icon.png", lable: "Food"),
    HabitModel(icon: "utili_icon.png", lable: "Utili"),
    HabitModel(icon: "health_icon.png", lable: "你好"),
  ];
  var bankcard = [
    CardInfo(
        leftIcon: "left_circle_logo.png",
        rightIcon: "circle_logo.png",
        desc: "Jenny Barnes",
        cardNumber: "**** 5868",
        money: 1234,
        isSelect: true),
    CardInfo(
        leftIcon: "citibank_logo.png",
        rightIcon: "visa_inc_logo.png",
        desc: "Jenny Barnes",
        cardNumber: "**** 1234",
        money: 1234),
    CardInfo(
        leftIcon: "capital_one_logo.png",
        rightIcon: "circle_logo.png",
        desc: "Jenny Barnes",
        cardNumber: "**** 8024",
        money: 1234),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //why use the scaffold
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
              size: 30,
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: <Widget>[
              _todoCard(), //分离组件
              //SizedBox(height: 10,),//组件隔离 间距
              Text(
                '   Spending Habits',
                style: _list(),
              ),
              Container(
                height: 115,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    //如果这个ListView外层不加
                    return _buildhabitcard(context, habits[index]);
                  },
                  itemCount: habits.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Text('   Mostly Paying with', style: _list()),
              Container(
                height: 520,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return _buildbankcard(context, bankcard[index]);
                  },
                  itemCount: bankcard.length,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        ));
  }

  ///两个 list 的统一样式
  _list() {
    return TextStyle(
        color: Color(0xff746A96), fontSize: 24, fontWeight: FontWeight.w400);
  }

  _buildbankcard(BuildContext context, CardInfo cardInfo) {
    return Container(
      padding: EdgeInsets.all(15), //what happening？
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //使得文本左对齐
        children: <Widget>[
          Container(//容器
            height: 149, //设置容器高度
            decoration: BoxDecoration(
                color: Color(0xff1CE1AC), //decoration 不能和color并排使用
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Image.asset(cardInfo.leftIcon),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: <Widget>[
                          Image.asset(cardInfo.rightIcon)
                        ],
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  ///离 增强项目结构可读性 构建推荐品牌卡片
  _todoCard() {
    return Container(
      padding: EdgeInsets.all(15), //what happening？
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //使得文本左对齐
        children: <Widget>[
          Text(
            'Baby \nGood  Morning',
            style: TextStyle(
                color: Color(0xffff3d00),
                fontSize: 48,
                fontWeight: FontWeight.w300),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              //容器
              height: 149, //设置容器高度
              decoration: BoxDecoration(
                  color: Color(0xffFF3D00), //decoration 不能和color并排使用
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: <Widget>[
                        Image.asset('onilne_shopping.png')
                        // 如果下方的文字太多 导致无法显示完全 使用Expanded( child: Text())
                        ,
                        Text(
                          'We have nice offers for  your favorite Brands',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      //what is Align 将整体容器放置右下角
                      alignment: Alignment.bottomRight,
                      child: Container(
                        //view 样式
                          width: 124,
                          height: 47,
                          decoration: BoxDecoration(
                              color: Color(0x4dFFffff),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'View',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.white)
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 构建 单个 中间习惯卡片 爱好列表开发
  Widget _buildhabitcard(BuildContext context, HabitModel habit) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 15, top: 8),
            child: Container(
              height: 72,
              width: 68,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Image.asset(habit.icon)
                ],
              ),
            )),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: <Widget>[Text(habit.lable)],
          ),
        )
      ],
    );
  }
}
