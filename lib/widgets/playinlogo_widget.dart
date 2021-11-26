import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayinLogoWidget extends StatelessWidget {

  final double size ;

  PlayinLogoWidget({this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        'assets/vector/google.svg',
        width: size,
        height: size,
      ),
    );
  }
}
