import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation2/screens/home/home_screen.dart';
import 'package:flutter_animation2/screens/splash/splash_screen.dart';
import 'package:flutter_animation2/screens/start/start_screen.dart';
import 'package:flutter_animation2/states/theme_state.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Flutter Animation and Theme';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeState())],
      builder: (context, _) {
        final themeState = Provider.of<ThemeState>(context);
        return MaterialApp(
          title: title,
          themeMode: themeState.themeMode,
          theme: SystemThemes.lightTheme,
          darkTheme: SystemThemes.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
