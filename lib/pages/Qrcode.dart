//这是QrcodeView类的控制页
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrcodeView extends StatefulWidget{
  @override
  _QrcodeViewState createState() => new _QrcodeViewState();
}

// 我写个 这个博客 有解释我为什么选择flutter开发app
//B站的聊天 不可以发连接 客气

//  哈哈哈哈哈


class _QrcodeViewState extends State<QrcodeView> {

  String barcode = '';
  Uint8List bytes = Uint8List(200);

  TextEditingController _controller;//写入框使用
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //按钮文字style
  static const TextStyle optionStyle =
  TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  initState() {//what happen?? 初始化状态
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        body: Container(
          padding: const EdgeInsets.all(15),//整个容器内填充
          child: ListView(
            children: <Widget>[
              SizedBox(
                child: Container(
                  height: 250,
                  color: Colors.grey,
                  child: Image.memory(bytes),
                  )
              ),
              SizedBox(height: 20),
              TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                decoration: InputDecoration(  icon: Icon(Icons.text_fields),labelText: '请输入你想要生成的网址',
                  helperText: '或者文本信息 eg: love', ),
                onSubmitted: (String value) async {
              await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text('You typed "$value".'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
              TextField(
                textAlign: TextAlign.center,
              ),
              Text('扫描 - RESULT:  $barcode',
              style: TextStyle(color: Colors.black,fontSize: 15),),
              GestureDetector(
                onTap: _scan,
                child: RaisedButton(
                  child: Text(
                    "扫一扫",
                    style: optionStyle,
                  ),
                  color: Colors.black,
                )
        ),
              RaisedButton(
                onPressed: _scanPhoto,
                child:
                Text(
                  "扫描本地相册",
                  style: optionStyle,
                ),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: _generateBarCode,
                child: Text(
                  "生成文本 - 网址",
                  style: optionStyle,
                ),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: _clearBarCode,
                child: Text(
                  "清除生成QR",
                  style: optionStyle,
                ),
                color: Colors.black,
              ),

            ],
          ),
        ),
    ) ;
  }

  //调用相机 扫码二维码解析
  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
  }

  Future _scanPhoto() async {
    String barcode = await scanner.scanPhoto();
    setState(() => this.barcode = barcode);
  }

  Future _generateBarCode() async {
    Uint8List result =
    await scanner.generateBarCode('https://yichangkong.gitee.io/');
    this.setState(() => this.bytes = result);
  }

  Future _clearBarCode() async {
    Uint8List barcodes = Uint8List(200); //初始化
    setState(() => this.bytes = barcodes);
  }
}
