import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';


class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => Home_Page())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [
            Colors.red.shade400,
                Colors.black

          ])
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.black,
                 radius: 110,
            foregroundImage: NetworkImage("https://wallpapers.com/images/hd/krishna-arjun-four-vedas-of-krishna-0fo6qeopo0oykh4n.jpg",),
            ),
          ),
      ),
    );
  }
}
