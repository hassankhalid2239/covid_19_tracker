import 'dart:async';
import 'package:covid_19_tracker/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller =  AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const WorldStates())));
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/virus.png'),
                  ),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },),
          SizedBox(height: MediaQuery.of(context).size.height* .08,),
          const Center(
            child: Text(
              'Covid 19\nTracker App',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
          )

        ],
      ),
    );
  }
}
