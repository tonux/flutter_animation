import 'dart:ui';
import 'package:flutter/material.dart';

// Define colors
const pink = Colors.pink;
const pinkDark = Colors.pinkAccent;

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    // Alignment animation (left to right)
    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    // Rotation animation (0 to 2 rotations)
    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animations Demo'),
      ),
      body: Center(
        child: BlurContainer(
          containerHeight: 200,
          child: AlignTransition(
            alignment: _alignAnimation,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: const Rectangle(
                color1: pink,
                color2: pinkDark,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  final double containerHeight;
  final Widget child;

  const BlurContainer({
    Key? key,
    required this.containerHeight,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: child,
        ),
      ),
    );
  }
}

class Rectangle extends StatelessWidget {
  final Color color1;
  final Color color2;
  final double width;
  final double height;

  const Rectangle({
    Key? key,
    required this.color1,
    required this.color2,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
