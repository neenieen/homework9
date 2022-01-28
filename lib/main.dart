import 'dart:math';

import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _controller = TextEditingController();
  late Game _game;

  HomePage({Key? key}) : super(key: key) {
    _game = Game(maxRandom: 100);
  }

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var showSeven = true;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Row(
                children: [
                  Container(width: 50.0, height: 50.0, color: Colors.blue),
                  Expanded(
                    child: Container(
                      width: 30.0,
                      height: 50.0,
                      //color: Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('FLUTTER', textAlign: TextAlign.end,),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  //SizedBox(width: 10.0),
                ],
              ),*/
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Container(color: Colors.green, width: 100.0, height: 50.0)),
                  Container(color: Colors.red, width: 50.0, height: 50.0),
                ],
              ),*/
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(width: 8.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock,
                              size: 80.0,
                              color: Colors.pinkAccent,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'กรุณาใส่รหัสผ่าน',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.pink.shade900,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) _buildButton4(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) _buildButton4(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) _buildButton4(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                  ),
                  _buildButton4(num: 0),
                  Container(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.backspace,
                    size: 40.0,
                    color: Colors.pinkAccent,

                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  child: Text('ลืมรหัสผ่าน'),
                  onPressed: () {

                    }

                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
          onPressed: () {
            print('You pressed $num');
          },
          child: Text('$num')),
    );
  }
}

Widget _buildButton4({int? num}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 75.0,
      height: 75.0,
      //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
      decoration: BoxDecoration(
          color: Colors.pink.shade100,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pinkAccent, width: 2.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // สีเงา
              offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
              blurRadius: 4.0,
              spreadRadius: 2.0,
            )
          ]
      ),
      child: OutlinedButton(
          onPressed: () {
            print('You pressed $num');
          },
          child: Text('$num')),
    ),
  );
}