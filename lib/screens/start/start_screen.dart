import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'start_info_page.dart';
import 'start_nickname_page.dart';
import 'start_email_page.dart';
import 'start_theme_select_page.dart';

import '../../utils/animation_item.dart';
import '../../widgets/playinlogo_widget.dart';
import '../../states/theme_state.dart';

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
    addAnimation(
        AnimationItem(
            name: 'start_screen_top_logo',
            tween: Tween(begin: 0.0, end: 1)), (animation) {
      setState(() {
        animationList.add(animation);
      });
    }, delayMs: 400);
  }

  void movePage({bool isPrevious = false}) {
    isPrevious
        ? _pageController.previousPage(
            duration: Duration(milliseconds: 400), curve: Curves.decelerate)
        : _pageController.nextPage(
            duration: Duration(milliseconds: 400), curve: Curves.decelerate);
  }

  void _eventAnimation() {
    logoPositionTween = _currentIndex == 0
        ? Tween(begin: 0.0, end: 0.8)
        : Tween(begin: 0.0, end: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = Provider.of<ThemeState>(context);
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
              StartInfoPage(
                movePage: movePage,
              ),
              StartNicknamePage(
                movePage: movePage,
              ),
              StartEmailPage(
                movePage: movePage,
              ),
              StartThemeSelectPage(
                movePage: movePage,
              )
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: _currentIndex == 0
                ? screenSize.height / 10
                : screenSize.height / 15,
            left: 0,
            right: 0,
            child: TweenAnimationBuilder(
              //최초시작시 애니메이션
              tween: findAnimation('start_screen_top_logo', 0, animationList),
              duration: Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              builder: (BuildContext context, valueObject, child) {
                return Transform.scale(
                  scale: double.parse(valueObject.toString()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TweenAnimationBuilder(
                      //토글전용 애니메이션
                      tween: logoPositionTween,
                      curve: Curves.decelerate,
                      duration: Duration(milliseconds: 300),
                      builder: (context, valueObject, child) {
                        return Transform.scale(
                            scale: double.parse(valueObject.toString()),
                            child: PlayinLogoWidget());
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedPositioned( //뒤로가기 버튼
            duration: Duration(milliseconds: 300),
            top: screenSize.height / 12,
            left: _currentIndex == 0 ? -80 : 0,
            width: 80,
            height: 80,
            child: IconButton(
              icon: Icon(Icons.chevron_left,size: 30,),
              onPressed: () {
                movePage(isPrevious: true);
              },
            ),
          ),

          AnimatedPositioned(
            bottom: _currentIndex==0?-40:screenSize.height *0.035,
            left: 0.0,
            right: 0.0,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            child: Row(
              mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: _currentIndex == 1 ? DynamicColors.getWhite70Black87(themeState.isDarkMode):DynamicColors.getWhite24Black38(themeState.isDarkMode),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: 28,
                  decoration: BoxDecoration(
                      color: _currentIndex == 2 ?  DynamicColors.getWhite70Black87(themeState.isDarkMode):DynamicColors.getWhite24Black38(themeState.isDarkMode),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: _currentIndex == 3 ? DynamicColors.getWhite70Black87(themeState.isDarkMode):DynamicColors.getWhite24Black38(themeState.isDarkMode),
                      shape: BoxShape.circle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
