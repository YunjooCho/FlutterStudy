import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //scaffold제거(_RandomWordsState에서 설정)
    return MaterialApp(
      // MODIFY with const
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
        ),
      ),
      home: RandomWords(), // REMOVE Scaffold
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
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
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

          final alreadySaved = _saved.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: TextStyle(
                color: const Color.fromARGB(100, 0, 51, 102),
                fontSize: 18,
                fontWeight: FontWeight.bold
                //_biggerFont
              )
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }

  void _pushSaved() { //Navigator스택에 즐겨찾기한 문장을 push(), pop()은 별도 구현필요없음
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
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
