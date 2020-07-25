//这是QrcodeView类的控制页
import 'package:flutter/material.dart';

class QrcodeView extends StatelessWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Text(
            "Qr_codeView",
            style: optionStyle,
          ),
        ),
      ),
    );
  }
}
