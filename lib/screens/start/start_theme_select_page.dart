import 'package:flutter/material.dart';
import 'package:flutter_animation2/widgets/color_picker_widget.dart';

import '../../utils/animation_item.dart';
import '../../utils/animation_item.dart';

class StartThemeSelectPage extends StatefulWidget {
  final Function movePage;

  StartThemeSelectPage({required this.movePage});

  @override
  _StartThemeSelectPageState createState() => _StartThemeSelectPageState();
}

class _StartThemeSelectPageState extends State<StartThemeSelectPage> with AutomaticKeepAliveClientMixin{
  List<AnimationItem> _animationList= [];
  Tween _buttonScaleTween = Tween(begin: 0,end: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setAnimationScenario();
  }

  void _setAnimationScenario(){
    addAnimation(AnimationItem(name:'start_theme_select_top_label', tween: Tween(begin: 0,end: 0)), (animation){
      setState(() {
        _animationList.add(animation);
      });
    },delayMs: 500);
    addAnimation(AnimationItem(name:'start_theme_select_bottom_button', tween: Tween(begin: 0,end: 1)), (animation){
      setState(() {
        _animationList.add(animation);
      });
    },delayMs: 1200);
  }

  void _eventAnimation(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(child:Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        SizedBox(),
        TweenAnimationBuilder(
            tween: findAnimation('start_theme_select_top_label', 20, _animationList),
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
                        '마지막으로 테마색깔을 선택해 주세요.',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              );
            }),

        Container(
            height: 150,
            child: ColorPickerWidget()),

        SizedBox(),

        TweenAnimationBuilder(
            tween: findAnimation('start_theme_select_bottom_button', 0, _animationList),
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
    ),);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive =>  true;
}
