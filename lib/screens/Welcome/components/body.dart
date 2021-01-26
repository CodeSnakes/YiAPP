import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappforstud/pages/Home.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下面这个写法值得借鉴
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO YiAPP",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RaisedButton(
                onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => new HomeView()
                  ))
                },
                color: Color(0xFF6F35A5),
                textColor: Colors.white,
                child: Text('  Let Me Go  ', style: TextStyle(fontSize: 20)),
                //圆角实现
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
              ),

  ])));
  }
}
