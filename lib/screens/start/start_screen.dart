import 'package:flutter/material.dart';
import 'package:flutter_animation2/screens/start/first_page.dart';
import 'package:flutter_animation2/screens/start/second_page.dart';
import 'package:flutter_animation2/utils/animation_item.dart';
import 'package:flutter_animation2/widgets/playinlogo_widget.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  List<AnimationItem> animationList = [];
  Tween logoPositionTween = Tween(begin: 0.0, end: 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delayAnimation();
    _pageController = PageController(initialPage: 0);
  }

  void _delayAnimation() {
    addAnimation(AnimationItem(name: 'start_screen_top_logo', tween: Tween(begin: 0.0, end: 1)),
        (animation) {setState(() {animationList.add(animation); });}, delayMs: 400);
  }

  void _eventAnimation() {
    logoPositionTween =_currentIndex == 0 ? Tween(begin: 0.0, end: 0.8) : Tween(begin: 0.0, end: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    _eventAnimation();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (page) {
              setState(() {
                _currentIndex = page;
              });
            },
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              FirstPage(
                pageController: _pageController,
              ),
              SecondPage(
                pageController: _pageController,
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: _currentIndex == 0 ? screenSize.height / 10 : screenSize.height / 15,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TweenAnimationBuilder(
                tween: logoPositionTween,
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 300),
                builder: (context, valueObject, child) {
                  return Transform.scale(
                      scale: double.parse(valueObject.toString()), child: PlayinLogoWidget());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
