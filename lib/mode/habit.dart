import 'dart:core';
class HabitModel{
  HabitModel({ this.icon,this.lable });
String icon;
String lable;
}
/***
 * 习惯卡牌信息
*/
 class CardInfo{

  CardInfo({
 this.leftIcon, this.rightIcon, this.desc, this.cardNumber,
      this.money, this.isSelect});
  String leftIcon;
  String rightIcon;
  String desc;
  String cardNumber;
  int money;
  bool isSelect=false;
}
