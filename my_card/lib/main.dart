import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //우측 상단의 Debugg 배너 없애기
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
      backgroundColor: Color.fromARGB(255, 165, 98, 10),
      appBar: AppBar(
        title: Text('The Kingdom of the Winds'),
        centerTitle: true, //AppBar에 표시되는 텍스트를 가운데 정렬
        backgroundColor: Color.fromARGB(255, 101, 66, 5),
        elevation: 0.0, //AppBar가 떠있는 듯한 효과를 없앰, 높이라는 뜻으로 double형의 숫자로 수치 조절
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //두 개의 텍스트 시작점을 맞춰서 정렬
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/windofEmp_pro.jpg'),
                radius: 45.0, //이미지 크기 조절
              ),
            ),
            Divider(
              height: 60.0, //Divider의 위, 아래 간격이 합쳐서 60이라는 뜻
              color: Colors.grey[850],
              thickness: 1.0,
              endIndent:
                  30.0, //상단의 EdgeInsets.fromLTRB에서 L부분을 30.0으로 지정했으므로 R부분도 30.0으로 맞춤
            ),
            Text(
              'JOB',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //글자 간격
              ),
            ),
            SizedBox(
              //텍스트 간의 간격 조정
              height: 10.0,
            ),
            Text(
              'Soccerer',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 간격
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              //텍스트 간의 간격 조정
              height: 30.0,
            ),
            Text(
              'LEVEL',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //글자 간격
              ),
            ),
            SizedBox(
              //텍스트 간의 간격 조정
              height: 10.0,
            ),
            Text(
              'Lv.640',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0, //글자 간격
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              //기술명을 나열하기 위해 사용
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'using lightsaber',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            Row(
              //기술명을 나열하기 위해 사용
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'face hero tatoo',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            Row(
              //기술명을 나열하기 위해 사용
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'fire flames',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/windofEmp_skill.gif'),
                radius: 60.0,
                backgroundColor:
                    Color.fromARGB(255, 165, 98, 10), //이미지 배경색 변경, 내 이미지에서는 안먹힘
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

//<나중에 찾아보기>
//Row Widget