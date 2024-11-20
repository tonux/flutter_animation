import 'package:flutter/material.dart';

class AnimationControllerPage extends StatefulWidget {
  @override
  _AnimationControllerPageState createState() =>
      _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // TickerProvider for vsync
    );

    // Define an animation that interpolates between 0 and 1
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {}); // Redraw on animation progress
      });
  }

  @override
  void dispose() {
    // Dispose of the controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationController Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated box
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(left: _animation.value),
            color: Colors.blue,
          ),
          const SizedBox(height: 50),

          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _controller.forward(),
                child: const Text('Forward'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _controller.reverse(),
                child: const Text('Reverse'),
              ),
              const SizedBox(width: 10),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _controller.repeat(),
                child: const Text('Repeat'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _controller.stop(),
                child: const Text('Stop'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _controller.reset(),
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
