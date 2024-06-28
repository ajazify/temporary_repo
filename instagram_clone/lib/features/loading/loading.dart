import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
      late final AnimationController _controller;

    return Scaffold(
      backgroundColor: Color(0xFF40C075),
      body: Center(
        child: Lottie.asset( repeat: false, reverse: true, 'assets/lottie/anim2.json'),
      ),
    );
  }
}
