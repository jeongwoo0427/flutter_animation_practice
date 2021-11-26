import 'package:flutter/material.dart';

typedef AnimationCallBack = void Function(AnimationItem animation);

class AnimationItem {
  final String name;
  final Tween<double> tween;

  AnimationItem({required this.name, required this.tween});
}

Future<void> addAnimation(
    AnimationItem animationItem, AnimationCallBack function, {int delayMs = 0} ) async {
  await Future.delayed(Duration(milliseconds: delayMs), () {});
  function(animationItem);
}

Tween findAnimation(String name, double initValue, List<AnimationItem> list) {
  try {
    if (list.length > 0) {
      var tween = list.where((element) => element.name == name);
      return tween.first.tween;
    } else {
      return Tween<double>(begin: initValue, end: initValue);
    }
  } catch (e) {
    return Tween<double>(begin: initValue, end: initValue);
  }
}


