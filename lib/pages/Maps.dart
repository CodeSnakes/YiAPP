//这是MapView类的控制页

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _assetsIcon = AssetImage('assets/images/test_icon.png');

class Maps extends StatefulWidget {
  Maps({Key key}) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<Maps> {
  AmapController _controller;
  String str = 'str';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
          body: Container(
              child: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            height: size.height * 0.55,

            child: AmapView(
              showZoomControl: true,
              showCompass: true,
              mapType: MapType.Satellite,
              maskDelay: Duration(milliseconds: 500),
              onMapCreated: (controller) async {
                _controller = controller;
              },
            ),
          ),
          SizedBox(height: 10,),
          CupertinoButton(
             color: Colors.orange,
            padding: EdgeInsets.all(10.0),
            child: Text('点击显示定位'),
            onPressed:  () async {
                await _controller.showMyLocation(MyLocationOption(
                  show: true,
                  myLocationType: MyLocationType.Locate,//定位一次并移动地图到中心
                  interval: Duration(seconds: 3),//多少秒刷新
                  iconProvider: _assetsIcon,
                ));
              },
          ),
          SizedBox(height: 10,),
          Card(
            color: Colors.orange,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.map),
                  title: Text('地图页面Tips',style: TextStyle(color: Colors.black),),
                  subtitle: Text('1.默认地图模式为卫星导航'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('Know It',style: TextStyle(color: Colors.black),),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}

class Toast {
  static void show({@required BuildContext context, @required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(message),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
