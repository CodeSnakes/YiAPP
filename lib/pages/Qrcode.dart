//这是QrcodeView类的控制页
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrcodeView extends StatefulWidget{
  @override
  _QrcodeViewState createState() => new _QrcodeViewState();
}

class _QrcodeViewState extends State<QrcodeView> {

  String barcode = '';
  Uint8List bytes = Uint8List(200);

  //按钮文字style
  static const TextStyle optionStyle =
  TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  initState() {//what happen?? 初始化状态
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.memory(bytes),
              ),
              Text('RESULT:  $barcode'),
              RaisedButton(
                onPressed: _scan,
                child: Text(
                  "Scan",
                  style: optionStyle,
                ),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: _scanPhoto,
                child: Text(
                  "Scan Photo",
                  style: optionStyle,
                ),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: _generateBarCode,
                child: Text(
                  "Generate Barcode",
                  style: optionStyle,
                ),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: _clearBarCode,
                child: Text(
                  "Clean Barcode",
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
