import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }


/*
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); //wordPair라는 변수에 두 개의 단어를 붙인 무작위 단어를 전달하라는 의미
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center( //기존에 const Center로 되어있었으나 에러발생하므로 const구문 제거
                            //매번 무작위로 random() 함수에 의해서 만들어지는 값을 const로
                            //지정할 수 없기 때문
                            //RandomWords라는 StatefulWidget을 생성하여 사용할 때 const구문 다시 복구
          //child: Text('Hello World'),
          //child: Text(wordPair.asPascalCase), //english_words 외부 패키지 활용
                                                //asPascalCase는 두 단어에서 각각 시작하는 첫 문자를 대문자로 바꾸는 것
          child: RandomWords(), //위젯을 함수형태로 호출???????
        ),
      ),
    );
  }
*/
}



class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider(
          thickness: 1,
          color: Colors.blueAccent,
        );

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
  */
}