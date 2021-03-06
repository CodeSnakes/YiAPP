//这是QrcodeView类的控制页
import 'dart:typed_data';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrcodeView extends StatefulWidget {
  @override
  _QrcodeViewState createState() => new _QrcodeViewState();
}


class _QrcodeViewState extends State<QrcodeView> {
  Size size;
  String barcode = '';
  String usercode= '';
  Uint8List bytes = Uint8List(200);
  GlobalKey _globalKey = GlobalKey();

  TextEditingController _controller; //写入框使用
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  //按钮文字style
  static const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Colors.blue);

  @override
  initState() {
    super.initState();//what happen?? 初始化状态
  }

 Future _saveNet() async {//下载网络图保存至本地文件夹
    print("Save");
    var response = await Dio().get(
        "https://gitee.com/yichangkong/FigureBed/raw/master/img/20200728002446.png",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);
  }

 Future _saveGentQR() async {//保存本地生成二维码图
    print('saveGen');
    final result = await ImageGallerySaver.saveImage(bytes);
  }
  //单击弹框
  Future<void> _showTips(BuildContext context) async {
    print("_showTips");
    return

      Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Page Function：可扫条形码、二维码，支持网址文本内容的二维码内容生成。'),
        action: SnackBarAction(
        label: 'OK I GET It!',
        onPressed: (){},
    ))) ;
  }

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              _showTips(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.help,
                    color: Colors.red,
                    size: 30,
                  ),
                ],
              ),
            )),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(15), //整个容器内填充
        child: ListView(
          children: <Widget>[
            Container(
              height:   size.height*0.40,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0x99E0DCE1),),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: size.height*0.25,
                        padding: EdgeInsets.all(15),
                        child: Image.memory(bytes),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton.extended(
                            backgroundColor: Colors.white,
                            label: Text('Save QR',style: optionStyle,),
                            onPressed: (){_saveGentQR();},
                          ),
                          SizedBox( width: 20),
                          FloatingActionButton.extended(
                            backgroundColor: Colors.white,
                            label: Text('Remove QR',style: optionStyle,),
                            onPressed: () { _clearBarCode();
                            },
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 20),
            TextField(
              textAlign: TextAlign.center,
              controller: _controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.text_fields),
                  labelText: '请输入你想要生成的网址',
                  helperText: '或者文本信息 eg: love'),
              onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: const Text('Are you want Generate it!'),
                          content: Text( "$value"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                usercode =value;
                                Navigator.pop(context);
                                _generateBarCode(value);
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                    },
                  );
              },
            ),
            Row(
              children: <Widget>[
                Icon(Icons.subject),
                SizedBox(
                  width: 17,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 5, top: 5),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.5, color: Colors.grey)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '扫描 - 信息:  $barcode',
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){_generateBarCode(usercode);} ,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/QR.png',
                          width: size.height*0.08,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Generte',
                          style: optionStyle,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: size.width*0.05,),
                GestureDetector(
                  onTap:  _scan,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/scanf.png',
                          width: size.height*0.08,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text( 'Scan', style: optionStyle, )
                      ],
                    ),
                  ),
                ),
                SizedBox( width:   size.width*0.05,),
                GestureDetector(
                  onTap: _scanPhoto,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/scan_fill.png',
                          width: size.height*0.08,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sacn Photo',
                          style: optionStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //调用相机 扫码二维码解析
  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  Future _scanPhoto() async {
    print("SCAN");
    String barcode = await scanner.scanPhoto();
    print("Scan:"+barcode);
    setState(() => this.barcode = barcode);
  }

  Future _generateBarCode(String string) async {
    if(string!=''){
      Uint8List result = await scanner.generateBarCode(string);
      this.setState(() => this.bytes = result);
    }else{
      print(string);
      Uint8List result = await scanner.generateBarCode('https://yichangkong.gitee.io/');
      this.setState(() => this.bytes = result);
    }
  }

  Future _clearBarCode() async {
    Uint8List barcodes = Uint8List(200); //初始化
    setState(() => this.bytes = barcodes);
  }

}
