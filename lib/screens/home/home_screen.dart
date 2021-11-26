import 'package:flutter/material.dart';
import 'package:flutter_animation2/states/theme_state.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        actions: [
          IconButton(
              onPressed: () {
                themeState.toggleTheme(!themeState.isDarkMode);
              },
              icon: Icon(themeState.isDarkMode ? Icons.wb_sunny_outlined : Icons.wb_sunny))
        ],
      ),
    );
  }
}
