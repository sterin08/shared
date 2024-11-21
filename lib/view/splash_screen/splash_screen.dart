// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_sample/view/home_screen/home_screen.dart';
import 'package:shared_sample/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),() async{

      final SharedPreferences prefs =
               await SharedPreferences.getInstance();
               final bool isLogged = prefs.getBool('isLogged')?? false;
               if(isLogged){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
               }
               else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
               }
    });
  }

  
@override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("SPLASH SCREEN",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
    );
  }
} 