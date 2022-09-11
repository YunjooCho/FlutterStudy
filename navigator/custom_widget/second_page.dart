import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context3) { //context3 : Second Page의 context
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: TextButton(
          child: Text(
              'Go to First Page'
          ),
          onPressed: (){
            Navigator.pop(context3);
          },
        ),
      ),
    );
  }
}
