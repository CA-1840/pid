import 'package:flutter/material.dart';

import 'app.dart';

/*
 常规输入
 */
class InputRoutine extends StatelessWidget {


  InputRoutine({Key? key,  required this.myNode , this.hintText='请输入内容', required this.codeController, this.enabled=false,this.keyboardType=TextInputType.text,this.maxLength=10,this.h=45}) : super(key: key);

  String hintText;

  FocusNode myNode;

  TextEditingController codeController;

  bool enabled;

  TextInputType  keyboardType;

  int maxLength;

  double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: App.hexToColor("#F4F4F4"),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow:  [
            BoxShadow(color: App.hexToColor("#DDDDDD"), offset: const Offset(0.0, 0.2), blurRadius: 0.2, spreadRadius: 0.2),
          ]
      ),
      child: TextField(
        focusNode: myNode,
        enabled: enabled,
        controller: codeController,
        keyboardType:keyboardType,
        style:  TextStyle(fontSize: 14, color: App.hexToColor("#383838")),
        maxLength: maxLength,
        decoration:  InputDecoration(
          counterText: '',
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xffBEBEBE)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }


}
