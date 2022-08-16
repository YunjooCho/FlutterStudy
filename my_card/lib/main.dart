import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character Card',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('My Poket'),
        centerTitle: true, //AppBar에 표시되는 텍스트를 가운데 정렬
        backgroundColor: Colors.amber[700],
        elevation: 0.0, //AppBar가 떠있는 듯한 효과를 없앰, 높이라는 뜻으로 double형의 숫자로 수치 조절
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 30.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //두 개의 텍스트 시작점을 맞춰서 정렬
          children: [
            Text('NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //글자 간격
              ),
            ),
            SizedBox(//텍스트 간의 간격 조정
              height: 10.0,
            ),
            Text('BBANTO',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //글자 간격
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
//9강 body부분
Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Axis : 축, 위젯을 상단/중단/하단으로 구분하여 정렬할 때 사용(Column은 위젯을 단순하게 세로로 정렬할 때 사용)
            children: [
              Text('Hello'),
              Text('Hello'),
              Text('Hello')
            ],
          ),
      ),
 */