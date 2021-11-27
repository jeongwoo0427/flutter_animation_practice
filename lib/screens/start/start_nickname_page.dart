import 'package:flutter/material.dart';
import 'package:flutter_animation2/utils/animation_item.dart';
import 'package:flutter_animation2/widgets/playinlogo_widget.dart';

class StartNicknamePage extends StatefulWidget {
  final Function movePage;

  StartNicknamePage({required this.movePage});

  @override
  _StartNicknamePageState createState() => _StartNicknamePageState();
}

class _StartNicknamePageState extends State<StartNicknamePage> {
  String _nickname = '';
  late Tween buttonScaleTween = Tween(begin: 0.0, end: 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void eventAnimation() {
    switch (_nickname.length == 0) {
      case true:
        buttonScaleTween = Tween(begin: 0, end: 0);
        break;
      case false:
        buttonScaleTween = Tween(begin: 0, end: 1);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    eventAnimation();
    double _height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(),
          SizedBox(),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (text) {
                  setState(() {
                    this._nickname = text;
                  });
                },
                style: TextStyle(fontSize: 21),
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelStyle: TextStyle(fontSize: 18),
                    hintText: '닉네임을 입력하세요',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '최대 글자수',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${_nickname.length}/32',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),


            ],
          ),
          SizedBox(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                tween: buttonScaleTween,
                duration: Duration(milliseconds: _nickname.length==0?100:400),
                curve: _nickname.length==0?Curves.decelerate:Curves.elasticOut,
                builder: (context, valueObject, child) {
                  return Transform.scale(
                    scale: double.parse(valueObject.toString()),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular((32)))),
                      onPressed: () {
                        widget.movePage();
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 20),
                          child: Text(
                            '다음',
                            style:
                            TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
