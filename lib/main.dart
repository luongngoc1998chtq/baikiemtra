import 'package:flutter/material.dart';

void main() {
  runApp(_baikiemtra());
}

class _baikiemtra extends StatefulWidget {
  @override
  __baikiemtraState createState() => __baikiemtraState();
}

class __baikiemtraState extends State<_baikiemtra> {
  int _count = 0;
  int _red = 0;
  int _green = 0;
  int _blue = 0;
  double _turn = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Stacked Architecture Demo',
            textScaleFactor: 1.1,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 80,
                          color: Color.fromRGBO(_red, 0, 0, 1),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          color: Color.fromRGBO(0, _green, 0, 1),
                          // color: Color.fromRGBO(r, g, b, opacity),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                         color: Color.fromRGBO(0, 0, _blue, 1),
                        ),
                      ],
                    ),
                    Slider(
                      value: _red.toDouble(),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (_redOpacity) {
                        setState(() {
                          _red = _redOpacity.toInt();
                          print(_redOpacity);
                          print(_red);
                        });
                      },
                    ),
                    Slider(
                      value: _green.toDouble(),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (_greenOpacity) {
                        setState(() {
                          _green = _greenOpacity.toInt();
                          print(_greenOpacity);
                          print(_green);
                        });
                      },
                    ),
                    Slider(
                      value: _blue.toDouble(),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (_blueOpacity) {
                        setState(() {
                          _blue = _blueOpacity.toInt();
                          print(_blueOpacity);
                          print(_blue);
                        });
                      },
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(_turn / 360),
                      alignment: FractionalOffset.center,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Color.fromRGBO(_red.round(), _green.round(),_blue.round(),1),
                          child: Text(
                        'Loren Ipsum',
                        style:new TextStyle(
                          color:Colors.white,
                          fontSize:30.0,
                          fontWeight:FontWeight.w900,
                          )
                      )
                      ),
                      ),
                    ),
                    Slider(
                      value: _turn,
                      min: 0,
                      max: 360,
                      divisions:360,
                      //label: '$_turn',
                      label: _turn.toInt().toString(),
                      onChanged: (_turntrigged){
                        setState(() {
                          _turn = _turntrigged;
                        }
                        );
                      },

                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Text('You have pusshed the button $_count turn !'),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: FlatButton(
                      color: Colors.grey[400],
                      child: Text('Reset'),
                      onPressed: () {
                        setState(() {
                          _count = 0;
                        }
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _count++;
                          print(_count);
                        }
                        );
                      },
                    ),
                    padding: EdgeInsets.only(bottom: 10, right: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}