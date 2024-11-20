import 'package:flutter/material.dart';

class SizeTransitionPage extends StatefulWidget {
  const SizeTransitionPage({Key? key}) : super(key: key);

  @override
  State<SizeTransitionPage> createState() => _SizeTransitionPageState();
}

class _SizeTransitionPageState extends State<SizeTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Define the animation curve
    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
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
        title: const Text('SizeTransition Demo'),
      ),
      body: Center(
        child: Container(
          width: 200, // Set a fixed width for the parent container
          child: SizeTransition(
            sizeFactor: _sizeAnimation,
            axis: Axis.vertical,
            axisAlignment: -1.0, // Align animation to the top
            child: const Rectangle(
              color1: Colors.blue,
              color2: Colors.blueAccent,
              width: 200, // Must match the parent container's width
              height: 200,
            ),
          ),
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
      child: const Text('Patientez...'),
    );
  }
}
