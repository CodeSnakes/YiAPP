//这是HomeView类的控制页
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappforstud/mode/habit.dart';
import 'Business.dart';
import 'Qrcode.dart';
import 'School.dart';


class HomeView extends StatefulWidget {//新建导航页面
  HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;//底部按钮index
  var navigationBarItem =[ BottomNavigationBarItem(
    icon: Icon(Icons.home),
    title: Text('Home'),
  ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      title: Text('Business'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera_enhance),
      title: Text('QRcode'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      title: Text('School'),
    ),];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  //不加setState  bottomNavigationBar 无法感知修改值
    });
  }
  List<Widget> _widgetOptions = [  Gethomelist(), BusinessView(),  QrcodeView(),  SchoolView(), ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(//why use the scaffold
            body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items:  navigationBarItem,
              currentIndex: _selectedIndex,
              selectedItemColor:  Color(0xffFF3D00),
              onTap: _onItemTapped,
              unselectedItemColor: Color(0x4dFF7A61),
              iconSize: 30,
              selectedFontSize: 18,
            )
        )
    );
  }
}
class Gethomelist extends StatelessWidget{
  //爱好卡片列表信息
  var habits = [
    HabitModel(icon: "shopping_icon.png", lable: "Shopping"),
    HabitModel(icon: "travel_icon.png", lable: "Travel"),
    HabitModel(icon: "health_icon.png", lable: "Health"),
    HabitModel(icon: "food_icon.png", lable: "Food"),
    HabitModel(icon: "utili_icon.png", lable: "Utili"),
    HabitModel(icon: "health_icon.png", lable: "你好"),
  ];
  var bankcard = [  CardInfo(
      leftIcon: "left_circle_logo.png",
      rightIcon: "circle_logo.png",
      desc: "Jenny Barnes",
      cardNumber: "**** 5868",
      money: 801546,
      isSelect: true),   CardInfo(
      leftIcon: "citibank_logo.png",
      rightIcon: "visa_inc_logo.png",
      desc: "Jenny Barnes",
      cardNumber: "**** 1234",
      money: 1234,
      isSelect: false), CardInfo(
      leftIcon: "capital_one_logo.png",
      rightIcon: "circle_logo.png",
      desc: "Jenny Barnes",
      cardNumber: "**** 8024",
      money: 2565452,
      isSelect: false), ];
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading:  GestureDetector(
                onTap: (){   _showMyDialog(context);  },
                child:
                Padding(padding: EdgeInsets.all(10),child:
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                      size: 30,
                    ),
                  ],
                ),)
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: <Widget>[
              _todoCard(), //分离组件
              //SizedBox(height: 10,),//组件隔离 间距
              Text(  '   Spending Habits', style: _list(), ),
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
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return _buildbankcard(context, bankcard[index]);
                },
                itemCount: bankcard.length,
                shrinkWrap: true, //what happen
                physics: NeverScrollableScrollPhysics(), //what happen
              ),
            ],
          ),
        ),
      );
  }

  _list() {
    return TextStyle(
        color: Color(0xff746A96), fontSize: 24, fontWeight: FontWeight.w400);
  }

  _buildbankcard(BuildContext context, CardInfo cardInfo) {
    return GestureDetector(
      //添加点击事件
        onTap: () {
          _showMyDialog(context);
        },
        child: Container(
          height: 160,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          //what happening？
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //分布空间？？
            children: <Widget>[
              Column(
                //容器 水平布局
                crossAxisAlignment: CrossAxisAlignment.start, //使得文本左对齐
                children: <Widget>[
                  Image.asset(cardInfo.leftIcon),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //what happen?
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Select",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: (cardInfo.isSelect
                                  ? Color(0xff1CE1AC)
                                  : Colors.white)),
                        ),
                        Text(
                          cardInfo.desc,
                          style:
                          TextStyle(color: Color(0xff746A96), fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(cardInfo.cardNumber,
                            style: TextStyle(
                                color: Color(0xff746A96), fontSize: 16))
                      ],
                    ),
                  )
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Column(
                        children: <Widget>[
                          Image.asset(cardInfo.rightIcon),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          //what happen
                          text: TextSpan(
                              text: '\$',
                              style: TextStyle(
                                  color: Color(0xff746A96), fontSize: 18),
                              children: [
                                TextSpan(
                                    text: '  ${cardInfo.money}',
                                    style: TextStyle(
                                        color: Color(0xff746A96), fontSize: 28))
                              ]),
                        ),
                        Text(
                          ' 00',
                          style: TextStyle(
                              color: Color(0xff746A96),
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ])
            ],
          ),
        ));
  }

  //单击弹框
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
            child: CupertinoAlertDialog(

              content: SingleChildScrollView(
                padding: EdgeInsets.all(15),

                child: ListBody(
                  children: <Widget>[
                    Text("Why to click me ??? \n Why???",style: TextStyle(fontSize: 28),),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text("Approve"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text("Come"),
                  onPressed: () {},
                ),
              ],
            ));
      },
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
