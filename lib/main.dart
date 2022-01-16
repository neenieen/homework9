import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLYMPIC BOXING SCORING',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guess Number'),),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          border: Border.all(
            color: const Color(0xBA9F07A3),
            width: 2.0),
          boxShadow:[
             BoxShadow(
               color: const Color(0xBAFA93FD),
               offset: Offset(3.0,3.0),//ตำแหน่งเงา เป็นdouble dx,dy
               blurRadius: 3.8, //ความเบลอของเงา
               spreadRadius: 3.0 //ความแผ่ของเงา
             )
          ]
        ),
        //alignment: Alignment.center,//คอนเทนเนอร์จะขยายเต็มจอ
        child: Center(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/guess_logo.png',width: 80.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('hello11231531',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xEBD70090),fontSize: 30.0),
                    ),
                    TextButton(
                      child: Text('Test'),
                      onPressed: () {},
                    ),
                  ],
                ),

                ElevatedButton(
                  child: Text('ElevatedButton'),
                  onPressed: (){},),
                OutlinedButton(child: Text('OutlinedButton'),
                  onPressed: (){},)


              ],
            )
        ),
      ),
    );
  }
}

