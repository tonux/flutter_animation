import 'dart:math';

import 'package:flutter/material.dart';

class ScaleTweenAnimationBuilderDesign extends StatefulWidget {
  const ScaleTweenAnimationBuilderDesign({super.key});

  @override
  State<ScaleTweenAnimationBuilderDesign> createState() =>
      _ScaleTweenAnimationBuilderDesignState();
}

// tween is used to give the starting and the ending value
Tween<double> myTweenValue = Tween<double>(begin: 1, end: 1);

class _ScaleTweenAnimationBuilderDesignState
    extends State<ScaleTweenAnimationBuilderDesign> {
  void scaleContainer() {
    setState(() {
      myTweenValue = Tween<double>(
        begin: 1,
        end: Random().nextDouble() * 5,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scale Tween Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
              tween: myTweenValue,
              duration: const Duration(seconds: 10),
              builder: (context, value, child) {
                // The child that the builder gives is taken from the child given below it in the tween animation builder
                // The value will be fetched from the tween
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Container(
                width: 300,
                height: 300,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: scaleContainer),
    );
  }
}
