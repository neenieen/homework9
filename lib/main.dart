// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GUESS THE NUMBER',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  late Game _game;
  static const buttonsize = 50.0;

  Login({Key? key}) : super(key: key) {
    _game = Game(maxRandom: 100);
  }

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _input = '';
  String _message = 'ทายเลข 1 ถึง 100';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          // เทียบเท่ากับ <div> ของ HTML
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.5),
                  offset: const Offset(10.0, 10.0),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                ),
              ]),

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 150),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GUESS ',
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.pink,
                          ),
                        ),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.pinkAccent,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _input,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    _message,style: TextStyle(
                    fontSize: 20.0,
                  ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) _buildButton4(i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) _buildButton4(i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) _buildButton4(i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton4(-2),
                  _buildButton4(0),
                  _buildButton4(-1),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {
                    var guess = int.tryParse(_input);
                    if (guess == null){
                      setState(() {
                        _message =
                        'กรุณากรอกข้อมูล';
                      });

                    }
                    var guessResult = widget._game.doGuess(guess!);
                    if (guessResult > 0) {
                      setState(() {
                        _message = '$guess : มากเกินไป';
                        _input = '';
                      });
                    } else if (guessResult < 0) {
                      setState(() {
                        _message = '$guess : น้อยเกินไป';
                        _input = '';
                      });
                    } else {
                      setState(() {
                        _message =
                        '$guess ถูกต้อง 🎉 คุณทายทั้งหมด ${widget._game
                            .guessCount} ครั้ง';
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton4(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(

        onPressed: () {
          if (num == -2) {
            setState(() {
              _input = '';
            });
          } else if (num == -1) {
            print('Backspace');
            setState(() {
              var length = _input.length;
              _input = _input.substring(0, length - 1);
            });
          } else {
            print('$num');
            setState(() {
              _input = '$_input$num';
            });
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: Login.buttonsize,
          height: Login.buttonsize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (num == -1)
                Icon(
                  Icons.backspace, // รูปไอคอน
                  size: 30.0, // ขนาดไอคอน
                  color: Colors.pink,
                )
              else if (num == -2)
                Icon(
                  Icons.clear, // รูปไอคอน
                  size: 30.0, // ขนาดไอคอน
                  color: Colors.pink,
                )
              else
                Text('$num'),
            ],
          ),
        ),
      ),
    );
  }
}