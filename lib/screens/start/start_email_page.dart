import 'package:flutter/material.dart';
import 'package:flutter_animation2/utils/animation_item.dart';
import 'package:flutter_animation2/widgets/playinlogo_widget.dart';

class StartEmailPage extends StatefulWidget {
  final Function movePage;

  StartEmailPage({required this.movePage});

  @override
  _StartEmailPageState createState() => _StartEmailPageState();
}

class _StartEmailPageState extends State<StartEmailPage> with AutomaticKeepAliveClientMixin{
  String _email = '';
  late Tween buttonScaleTween = Tween(begin: 0.0, end: 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void eventAnimation() {
    switch (_email.length == 0) {
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
                    this._email = text;
                  });
                },
                style: TextStyle(fontSize: 21),
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelStyle: TextStyle(fontSize: 16),
                    hintText: 'dev@inpsyt.co.kr',
                    hintStyle: TextStyle(fontSize: 16),
                    border: InputBorder.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '이메일을 입력하세요.',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${_email.length}/64',
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
                duration: Duration(milliseconds: _email.length==0?100:400),
                curve: _email.length==0?Curves.decelerate:Curves.elasticOut,
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
