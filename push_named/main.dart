import 'package:flutter/material.dart';
import 'package:push_named/ScreenA.dart';
import 'package:push_named/ScreenB.dart';
import 'package:push_named/ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //제일 처음 보여질 route를 호출
      routes: {
        '/' : (context) => ScreenA(), //키값 '/'가 불려지면 ScreenA가 실행
        '/b' : (context) => ScreenB(),
        '/c' : (context) => ScreenC(),
      },
    );
  }
}
