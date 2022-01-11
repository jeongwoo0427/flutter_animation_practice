import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/theme_state.dart';

class ColorPickerWidget extends StatefulWidget {
  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {

  bool _isSelectedDark = false;

  @override
  Widget build(BuildContext context) {
    ThemeState themeState = Provider.of<ThemeState>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        GestureDetector(child: colorItem(!_isSelectedDark,Colors.white70),onTap: (){
          setState(() {
            _isSelectedDark = false;
            themeState.toggleTheme(_isSelectedDark);
          });
        },),
        SizedBox(width: 18,),
        GestureDetector(child: colorItem(_isSelectedDark,Colors.black54),onTap: (){
          setState(() {
            _isSelectedDark = true;
            themeState.toggleTheme(_isSelectedDark);
          });
        },),
      ],
    );
  }
  
  Widget colorItem(bool isSelected,Color color){
    return  AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.elasticOut,
      height: isSelected?100:70,
      width: isSelected?100:70,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border:  Border.all(width: 4, color: isSelected?Theme.of(context).iconTheme.color!:Colors.white ),
        boxShadow: [
          BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 10),
              blurRadius: 10)
        ],
      ),
    );
  }
}
