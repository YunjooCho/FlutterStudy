import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//Toast 라이브러리 사용
//pubspec.yaml에서 fluttertoast: ^8.0.9 기입 후, pug get 실행
//https://pub.dev/packages/fluttertoast/install 참조

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          child: Text('Toast',
          style: TextStyle(
            fontSize: 50.0,
            shadows: <Shadow>[ //글씨 그림자효과
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 4.0,
                color: Color.fromARGB(150, 0, 0, 0),
              ),
            ],
          ),
          ),
          style: ButtonStyle(
            surfaceTintColor: ButtonStyleButton.allOrNull<Color>(Colors.cyan), //클릭했을 때 색상이 퍼지는 애니메이션
          ),
          onPressed: () {
            flutterToast();
          },
        ),
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(msg: 'This is Flutter Toast',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    fontSize: 20.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}