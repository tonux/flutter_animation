import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPositioned Demo'),
      ),
      body: Stack(
        children: [
          // AnimatedPositioned inside a Stack
          AnimatedPositioned(
            top: _isMoved ? 300 : 100, // Change position on state change
            left: _isMoved ? 200 : 50,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMoved = !_isMoved; // Toggle position on tap
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: _isMoved
                    ? Colors.red
                    : Colors.blue, // Change color dynamically
                child: Center(
                  child: Text(
                    _isMoved ? 'Home' : 'School',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
