import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  int selectedItemIndex = 0; // Track the selected item index
  final double itemHeight = 60.0; // Height of each item in the list
  final Color yellow = Colors.yellow.shade700;
  final Color pink = Colors.pink.shade400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated List Page'),
      ),
      body: Stack(
        children: [
          // List of items
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedItemIndex = index;
                  });
                },
                child: Container(
                  height: itemHeight,
                  alignment: Alignment.center,
                  color: index % 2 == 0
                      ? Colors.grey.shade200
                      : Colors.grey.shade300,
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            },
          ),

          // Animated container overlay
          AnimatedPositioned(
            top: selectedItemIndex * itemHeight,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: yellow,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                child: Center(
                  child: Text('Featured Item $selectedItemIndex'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
