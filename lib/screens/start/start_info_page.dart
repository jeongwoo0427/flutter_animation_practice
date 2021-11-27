import 'package:flutter/material.dart';
import 'package:flutter_animation2/states/theme_state.dart';
import 'package:flutter_animation2/utils/animation_item.dart';
import 'package:flutter_animation2/widgets/playinlogo_widget.dart';
import 'package:provider/provider.dart';

class StartInfoPage extends StatefulWidget {
  final Function movePage;
  StartInfoPage({required this.movePage});
  @override
  _StartInfoPageState createState() => _StartInfoPageState();
}

class _StartInfoPageState extends State<StartInfoPage> with AutomaticKeepAliveClientMixin{
  List<AnimationItem> animationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setAnimationScenario();
  }

  void setAnimationScenario() {

    addAnimation(AnimationItem(name: 'start_first_top_label', tween: Tween(begin: 0, end: 0)),
        (animation) {
      setState(() {
        animationList.add(animation);
      });
    }, delayMs: 1000);

    addAnimation(
        AnimationItem(name: 'start_first_center_label', tween: Tween(begin: 0, end: 0)),
        (animation) {
      setState(() {
        animationList.add(animation);
      });
    }, delayMs: 1800);

    addAnimation(
        AnimationItem(name: 'start_first_bottom_button', tween: Tween(begin: 0, end: 1)),
        (animation) {
      setState(() {
        animationList.add(animation);
      });
    }, delayMs: 2800);


  }

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = Provider.of<ThemeState>(context);
    //print('FirstPage : setState()');
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 120,),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder(
                  tween: findAnimation('start_first_top_label', 20, animationList),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  builder: (context, valueObject, child) {
                    double value = double.parse(valueObject.toString());
                    return SizedBox(
                      height: 80,
                      child: Padding(
                          padding: EdgeInsets.only(top: (double.parse(value.toString()) * 3)),
                          child: AnimatedOpacity(
                            opacity: value >= 20 ? 0 : 1,
                            duration: Duration(milliseconds: 400),
                            child: Text(
                              '안녕하세요.',
                              style: TextStyle(fontSize: 24),
                            ),
                          )),
                    );
                  }),
              TweenAnimationBuilder(
                  tween: findAnimation('start_first_center_label', 20, animationList),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  builder: (context, valueObject, child) {
                    double value = double.parse(valueObject.toString());
                    return SizedBox(
                      height: 80,
                      child: Padding(
                          padding: EdgeInsets.only(top: (double.parse(value.toString()) * 3)),
                          child: AnimatedOpacity(
                            opacity: value >= 20 ? 0 : 1,
                            duration: Duration(milliseconds: 400),
                            child: Text(
                              '플레인에 오신것을 환영합니다!',
                              style: TextStyle(fontSize: 24),
                            ),
                          )),
                    );
                  }),
            ],
          ),
          TweenAnimationBuilder(
              tween: findAnimation('start_first_bottom_button', 0, animationList),
              curve: Curves.elasticOut,
              duration: Duration(milliseconds: 800),
              builder: (context, valueObject, child) {
                double value = double.parse(valueObject.toString());
                return Transform.scale(
                    scale: value,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((32)))),
                      onPressed: () {
                        widget.movePage();
                        //themeState.toggleTheme(!themeState.isDarkMode);
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                          child: Text(
                            '다음',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ));
              })
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
