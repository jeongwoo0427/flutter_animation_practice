import 'package:flutter/material.dart';
import 'package:flutter_animation2/screens/start/start_screen.dart';
import 'package:flutter_animation2/widgets/playinlogo_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1300),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return StartScreen();
      }));
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PlayinLogoWidget(size: 100,),
      ),
    );
  }
}
