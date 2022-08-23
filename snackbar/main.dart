import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
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
        title: AppBar(
          title: Text('Snack Bar'),
          centerTitle: true,
        ),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          //가장 가까운 Scaffold(상위에 바로 위치한 Scaffold가 호출)
          //페이지를 이동해도 SnackBar가 지정된 시간만큼 유지
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Like a new Snack Bar!'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(),
                    ));
              },
            ),
          ));
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text(
            'Go to the second page',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
          }),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(
          '"좋아요"가 추가되었습니다',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //페이지가 바뀌면 SnackBar가 바로 사라지게 하는 방법(기존과 동일하게 Builder 위젯 용용)
    //하단의 ScaffoldMessenger는 MaterialApp이 기본적으로 가지고 있는 ScaffoldMessenger와
    //다른 새로 생성된 인스턴스로 Scaffold의 위치정보를 가지고 있지 않음
    return ScaffoldMessenger(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"좋아요"를 취소하시겠습니까',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('"좋아요"가 취소되었습니다.'),
                    duration: Duration(seconds: 3),
                  ));
                },
                child: Text('취소하기'),
              ),
            ],
          ),
        );
      }),
    ));
  }
}

//과거 SnackBar 구현 코드
// Center(
//         child: FlatButton(
//             child: Text(
//               'Show me',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             color: Colors.red,
//             onPressed: () {
//               //Scaffold.of(context)로 Scaffold의 위치를 참조한 뒤, showSnackBar()로 스낵바를 구현
//               ScaffoldMessenger.of(context)
//                   .showSnackBar(Snackbar(content: Text('Hello')));
//             }
//         ),
//       ),
