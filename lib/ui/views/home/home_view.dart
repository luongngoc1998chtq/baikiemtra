import 'package:flutter/material.dart';
//import 'package:KT/ui/wedgets/decora.dart';
//import 'package:KT/ui/views/wedgets/transform.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context,HomeViewModel model, child) => 
       Center(
        child: Column(
         children: <Widget>[
           Container(
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          color: model.getColor('red')
                          ),
                        Container(
                          color: model.getColor('green')
                          ),
                        Container(
                          color: model.getColor('blue')
                          ),
                      ],
                    ),
                    Slider(
                      value: model.red.toDouble(),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (_redOpacity) {
                        model.updateColorRed(_redOpacity);
                      },
                    ),
                    Slider(
                      value: model.green.toDouble(),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (_greenOpacity) {
                        model.updateColorRed(_greenOpacity);
                      },
                    ),
                    Slider(
                      value: model.blue.toDouble(),
                      min: 0,
                      max: 255,
                      divisions: 255,
                      onChanged: (_blueOpacity) {
                        model.updateColorRed(_blueOpacity);
                      },
                    ),
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(model.turn / 360),
                      alignment: FractionalOffset.center,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Color.fromRGBO(model.red.round(), model.green.round(),model.blue.round(),1),
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
                      value: model.turn,
                      min: 0,
                      max: 360,
                      divisions:360,
                      //label: '$_turn',
                      label: model.turn.toInt().toString(),
                      onChanged: (_turntrigged){
                         model.updateValue(_turntrigged);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Text('You have pusshed the button $model.count turn !'),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10, right: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      viewModelBuilder: () => HomeViewModel()
    );
  }
}