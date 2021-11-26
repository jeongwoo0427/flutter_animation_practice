import 'package:flutter/material.dart';
import 'package:flutter_animation2/utils/animation_item.dart';
import 'package:flutter_animation2/widgets/playinlogo_widget.dart';

class SecondPage extends StatefulWidget {
  PageController pageController;

  SecondPage({required this.pageController});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _nickname = '';
  late Tween buttonScaleTween = Tween(begin: 0.0, end: 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void eventAnimation(){
    switch(_nickname.length==0){
      case true:
        buttonScaleTween = Tween(begin: 0.0,end: 0.0);
        break;
      case false:
        buttonScaleTween = Tween(begin: 0.0,end: 0.25);
        break;
    }


  }

  @override
  Widget build(BuildContext context) {
    eventAnimation();
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (text) {
                  setState(() {
                    this._nickname = text;
                  });
                },
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontSize: 21),
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    hintText: '닉네임을 입력하세요',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 18),
                    border: InputBorder.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '최대 글자수',
                    style: TextStyle(fontSize: 14, color: Colors.white38),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${_nickname.length}/32',
                    style: TextStyle(fontSize: 14, color: Colors.white38),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 30,
            child: TweenAnimationBuilder(
              tween: buttonScaleTween,
              duration: Duration(milliseconds: 400),
              builder: (context, valueObject, child) {
                return Transform.scale(
                  scale: double.parse(valueObject.toString()),
                  child: PlayinLogoWidget(),
                );
              },
            ))
      ],
    );
  }
}
