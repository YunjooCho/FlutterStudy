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

//context는 BuildContext의 인스턴스
//Scaffold.of(context)로 Scaffold의 위치를 참조한 뒤, showSnackBar()로 스낵바를 구현
//SnackBar는 Scaffold위에 그려져야 하기 때문에 Scaffold의 위치를 참조하여 그 곳에 SnackBar를 그릴 수 있도록 알려줘야 함

//Scaffold.of(context) method : 현재 주어진 context에서 위로 올라가면서 가장 가까운 Scaffold를 찾아서 반환
//Something.of(context) : 위로 거슬러 올라가면서 가장 가까운 Something을 찾아서 반환 (예. Theme.of(context))

//Scafold.of(context)를 찾아가다 보면 Scaffold가 MyApp 위젯에 속해있으므로 MyApp위젯의 상위 위젯들에서 Scaffold를 찾는 현상이 일어나지만
//상위 위젯들에서 Scaffold가 구현되어 있지 않으므로 찾을 수 없음
//Scaffold 보다 하위 위젯에서 Scaffold위젯을 찾게 하기 위해 Builder위젯을 사용
//Builder위젯은 지금까지 사용하던 context는 무시하고 새로운 context를 생성하여 사용하도록 함
//Scaffold위젯 하단에 Builder위젯을 사용하면 Scaffold.of(context)는 이 Builder부분부터 위로 거슬러 올라가면서 찾으므로 Scaffold를 찾을 수 있게 됨


// body: Builder(
//   builder: (BuildContext ctx) {
//      return Center(
//         child: FlatButton(
//             child: Text(
//               'Show me',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             color: Colors.red,
//             onPressed: () {
//               Scaffold.of(ctx)
//                   .showSnackBar(Snackbar(content: Text('Hello')));
//             }
//         ),
//       );
//   },
// )