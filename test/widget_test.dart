import 'package:flutter/material.dart';

class OlympicBoxScoring extends StatefulWidget {
  const OlympicBoxScoring({Key? key}) : super(key: key);

  @override
  _OlympicBoxScoringState createState() => _OlympicBoxScoringState();
}

class _OlympicBoxScoringState extends State<OlympicBoxScoring> {
  double iconPSize = 80.0;
  double iconPBSize = 30.0;
  double textSSize = 30.0;
  double iconCSize = 40.0;
  double textNameSize = 16.5;
  double textNameCSize = 20.0;

  bool isThaiwin = false;
  bool isIrewin = false;
  bool isButtonAvailable = true;
  int rCount = 0;
  List<int> ireS = [];
  List<int> thaiS = [];
  List<Widget> scoringBar = [];
  int totalIre = 0;
  int totalThai = 0;

  _countScore(bool isred) {
    setState(() {
      rCount++;
      if (rCount <= 3) {
        if (isred) {
          ireS.add(10);
          thaiS.add(9);
        } else {
          ireS.add(9);
          thaiS.add(10);
        }
        totalIre += ireS[rCount - 1];
        totalThai += thaiS[rCount - 1];
        _addScoringBar('ROUND $rCount', ireS[rCount - 1], thaiS[rCount - 1]);
        if(rCount == 3){
          isButtonAvailable = false;
          _addScoringBar('TOTAL', totalIre, totalThai);
          if (totalIre > totalThai) {
            isIrewin = true;
          } else {
            isThaiwin = true;
          }
        }
      } else {

      }
    });
  }

  _addScoringBar(String round, int ireScore, int thaiScore) {
    Widget sb = Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(round)],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '$ireScore',
                style: TextStyle(fontSize: textSSize),
              ),
              Text(
                '$thaiScore',
                style: TextStyle(fontSize: textSSize),
              )
            ],
          ),
          Divider(
            thickness: 2.0,
          )
        ],
      ),
    );
    scoringBar.add(sb);
  }

  _initializeScore(){
    setState(() {
      isThaiwin = false;
      isIrewin = false;
      rCount = 0;
      ireS = [];
      thaiS = [];
      scoringBar = [];
      totalIre = 0;
      totalThai = 0;
      isButtonAvailable = true;
    });
  }

  Widget _buildPersonButton(Color color) {
    bool isred = false;
    if (color == Color(0xFFA00000)) {
      isred = true;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _countScore(isred),
          style: ElevatedButton.styleFrom(
              primary: color, padding: EdgeInsets.symmetric(vertical: 18.0)),
          child: Icon(
            Icons.person,
            size: iconPBSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OLYMPIC BOXING SCORING"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 25.0,
                    color: Colors.black,
                    child: Text(
                      "Women's Light (57-60kg) Semi-final",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xFFA00000),
                  size: iconPSize,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: Image.asset(
                              'assets/images/flag_ireland.png',
                              height: 25.0,
                            ),
                          ),
                          Text(
                            'IRELAND',
                            style: TextStyle(fontSize: textNameCSize),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'HARRINGTON Kellie Anne',
                      style: TextStyle(fontSize: textNameSize),
                    )
                  ],
                ),
                if (isIrewin)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.check,
                          size: iconCSize,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xFF0000A0),
                  size: iconPSize,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: Image.asset(
                              'assets/images/flag_thailand.png',
                              height: 25.0,
                            ),
                          ),
                          Text(
                            'THAILAND',
                            style: TextStyle(fontSize: textNameCSize),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'SEESONDEE Sudaporn',
                      style: TextStyle(fontSize: textNameSize),
                    )
                  ],
                ),
                if (isThaiwin)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.check,
                          size: iconCSize,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8.0,
                    color: Color(0xFFA00000),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 8.0,
                    color: Color(0xFF0000A0),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                children: scoringBar,
              ),
            ),
            if (isButtonAvailable)
              Row(
                children: [Color(0xFFA00000), Color(0xFF0000A0)]
                    .map((e) => _buildPersonButton(e))
                    .toList(),
              )
            else
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: _initializeScore,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, padding: EdgeInsets.symmetric(vertical: 18.0)),
                        child: Icon(
                          Icons.clear,
                          size: iconPBSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
