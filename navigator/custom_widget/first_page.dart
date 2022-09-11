import 'package:flutter/material.dart';
import 'package:navigator/custom_widget/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context2) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),

      ),
      body: Center(
        child: TextButton(
          child: Text('Go to Second Page'),
          onPressed: () {
            //context2가 필요한 이유는 context2가 가지고 있는 위젯트리의 위치정보에 근거해 화면상에 보여지는 페이지가 어떤 페이지인지 확인하고 이 페이지에
            //push함수가 이동하길 원하는 route를 쌓아올려야 하기 때문(First Page의 위치정보를 가지고 있음)
            //builder는 어떤 위젯이 MaterialPageRoute를 통해 호출되어야 하는 지를 정의,
            //해당 코드를 사용하는 이유는 일종의 안전장치로 route는 여기저기 호출되는데 이 과정에서
            //다른 context를 사용하여 에러를 발생 시킬 수 있음, 이를 미연에 방지하는 기능이 builder를 통한 호출임
            //context를 사용하지 않으므로 '_'(Underscore)로 변경
            //SecondPage는 자체 context(context3)를 가지고 있고 pop()또한 context3를 사용하고 있기 때문에 여기서 '_'로 바꾸어도 영향이 없음
            Navigator.push(context2, MaterialPageRoute(builder: (_) => SecondPage()));
            //Navigator.of(context2).push(_createRoute());
          },
        ),
      ),
    );
  }

  //Navigator는 Stack구조를 사용하고 있기 때문에 push, pop을 통해 핸들링

  //Tween - 아래로 내려가는 애니매이션 시도했으나 잘 안됨
  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = Offset(0.0, 1.0);
  //       var end = Offset.zero;
  //       var tween = Tween(begin: begin, end: end);
  //       var offsetAnimation = animation.drive(tween);
  //       return child;
  //     },
  //   );
  // }

}

/** Navigator **/
// Navigator.push(context2, MaterialPageRoute(
//   builder:(BuildContext context){
//       return SecondPage();
//     }
//   )
// )