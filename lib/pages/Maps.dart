//这是MapView类的控制页
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  Maps({Key key}) : super(key: key);
  @override
  _MapsViewState createState() => _MapsViewState();
}
class _MapsViewState extends State<Maps> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        appBar: AppBar(title: const Text('Map',style: TextStyle(color: Colors.red),),
          backgroundColor: Colors.white,),
        body:
                Container(
                  child:  AmapView(),
                )
      ),
    );
  }
}

