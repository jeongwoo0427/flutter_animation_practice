import 'package:flutter/material.dart';
import 'package:flutter_animation2/utils/animation_item.dart';
import 'package:flutter_animation2/widgets/fade_animated_widget.dart';

class StartCompleteScreen extends StatefulWidget {
  @override
  _StartCompleteScreenState createState() => _StartCompleteScreenState();
}

class _StartCompleteScreenState extends State<StartCompleteScreen> {
  List<AnimationItem> _animationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addAnimation(
        AnimationItem(name: 'start_complete_center_first_label', tween: Tween(begin: 0, end: 0)),
        (animation) {
      setState(() {
        _animationList.add(animation);
      });
    }, delayMs: 800);

    addAnimation(
        AnimationItem(name: 'start_complete_center_second_label', tween: Tween(begin: 0, end: 0)),
        (animation) {
      setState(() {
        _animationList.add(animation);
      });
    }, delayMs: 1600);

    addAnimation(AnimationItem(name: 'start_complete_bottom_next', tween: Tween(begin: 0, end: 0)),
        (animation) {
      setState(() {
        _animationList.add(animation);
      });
    }, delayMs: 2600);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 60,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeAnimatedTextWidget(
                  child: Text(
                    '준비가 완료되었어요.',
                    style: TextStyle(fontSize: 24),
                  ),
                  animationName: 'start_complete_center_first_label',
                  animationList: _animationList,
                  durationMs: 600,
                ),
                FadeAnimatedTextWidget(
                  child: Text(
                    '이제 시작할까요?',
                    style: TextStyle(fontSize: 20),
                  ),
                  animationName: 'start_complete_center_second_label',
                  animationList: _animationList,
                  durationMs: 600,
                ),
              ],
            ),
            FadeAnimatedTextWidget(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((32)))),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return StartCompleteScreen();
                  }));
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                    child: Text(
                      '다음',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              animationName: 'start_complete_bottom_next',
              animationList: _animationList,
              durationMs: 600,
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
