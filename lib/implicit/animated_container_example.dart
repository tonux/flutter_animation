import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerPage> {
  // Variables d'état
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  // Fonction pour changer l'état
  void _changeContainerProperties() {
    setState(() {
      _width = (_width == 100.0) ? 200.0 : 100.0;
      _height = (_height == 100.0) ? 200.0 : 100.0;
      _color = (_color == Colors.blue) ? Colors.red : Colors.blue;
      _borderRadius = (_borderRadius == BorderRadius.circular(8.0))
          ? BorderRadius.circular(50.0)
          : BorderRadius.circular(8.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Demo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _changeContainerProperties,
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            // Durée de l'animation
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
