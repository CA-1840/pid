import 'package:flutter/material.dart';
import 'package:pid/page/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // 去掉空安全  --no-sound-null-safety
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginWidget(key: GlobalKey(debugLabel: "login"),),
    );
  }
}

