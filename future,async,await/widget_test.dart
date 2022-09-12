import 'dart:io';

void main() {
  showData();
}

void showData() async{
  startTask();
  String? account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작';
  print(info1);
}

Future<String> accessData() async{

  String? account;

  Duration time = Duration(seconds: 3);
  
  if(time.inSeconds >2){
    //sleep(time);
    //두번째 인자 : 함수형태로 delay시 실행될 코드
    //Future.delayed를 만나면 3초동안 실행이 중단되고
    //다음 코드로 넘어감
    //fetchData()가 실행된 후, 3초 후에 info2변수값 생성 및 초기화
   await Future.delayed(time, (){
     //String info2 = '데이터 처리 완료';
     //print(info2);
     account = '8,500만원';
     print(account);
   });
  }else{
    String info2 = '데이터를 가져왔습니다';
    print(info2);
  }

  return account!;
}

void fetchData(String account) {
  String info3 = '잔액은 $account 입니다';
  print(info3);
}