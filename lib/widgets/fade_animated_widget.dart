import 'package:flutter/material.dart';
import 'package:flutter_animation2/utils/animation_item.dart';

class FadeAnimatedTextWidget extends StatefulWidget {

  final Widget child;
  final String animationName;
  final List<AnimationItem> animationList;
  final double height;
  final int durationMs;
  final Curve curve;

  FadeAnimatedTextWidget({required this.child,required this.animationName,required this.animationList,this.height= 60,this.durationMs = 500,this.curve = Curves.easeOutCubic});

  @override
  _FadeAnimatedTextWidgetState createState() => _FadeAnimatedTextWidgetState();
}

class _FadeAnimatedTextWidgetState extends State<FadeAnimatedTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: findAnimation(widget.animationName, 20, widget.animationList),
      duration: Duration(milliseconds: widget.durationMs),
      curve: widget.curve,
      builder: (context, valueObject, child) {
        double value = double.parse(valueObject.toString());
        return SizedBox(
            height: widget.height,
            child: Padding(
              padding: EdgeInsets.only(top: value),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: widget.durationMs),
                opacity: value >= 20 ? 0 : 1,
                child: widget.child,
              ),
            ));
      },
    );
  }
}
