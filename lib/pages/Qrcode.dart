//这是QrcodeView类的控制页
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrcodeView extends StatefulWidget {
  @override
  _QrcodeViewState createState() => new _QrcodeViewState();
}


class _QrcodeViewState extends State<QrcodeView> {
  String barcode = '';
  String usercode= '';
  Uint8List bytes = Uint8List(200);

  TextEditingController _controller; //写入框使用
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //按钮文字style
  static const TextStyle optionStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue);

  @override
  initState() {
    //what happen?? 初始化状态
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
                Text(
                  "Why to click me ??? \n Why???",
                  style: TextStyle(fontSize: 28),
                ),
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
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              _showMyDialog(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
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
              height: 320,
              color: Color(0x99E0DCE1),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 250,
                        padding: EdgeInsets.all(15),
                        child: Image.memory(bytes),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton.extended(
                            backgroundColor: Colors.white,
                            label: Text('Save QRImage',style: optionStyle,),
                            onPressed: () {  _showMyDialog(context); },
                          ),
                          SizedBox( width: 20,  ),
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
                    width: 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/QR.png',
                          width: 80,
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
                SizedBox(width: 2),
                GestureDetector(
                  onTap:  _scan,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 125,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/scanf.png',
                          width: 80,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text( 'Scan', style: optionStyle, )
                      ],
                    ),
                  ),
                ),
                SizedBox( width: 2),
                GestureDetector(
                  onTap: _scanPhoto,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 125,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/scan_fill.png',
                          width: 80,
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
    String barcode = await scanner.scanPhoto();
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
