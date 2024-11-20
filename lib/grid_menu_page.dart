import 'package:animation_demo/dice/dice.dart';
import 'package:animation_demo/explicit/animated_builder.dart';
import 'package:animation_demo/explicit/animation_controller_page.dart';
import 'package:animation_demo/explicit/explicit_animation_1.dart';
import 'package:animation_demo/explicit/size_transition_page.dart';
import 'package:animation_demo/implicit/animated_container_example.dart';
import 'package:animation_demo/implicit/animated_list_page.dart';
import 'package:animation_demo/implicit/animated_positioned_page.dart';
import 'package:animation_demo/implicit/tween_animation_page.dart';
import 'package:flutter/material.dart';

class GridMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'AnimatedContainer',
        'icon': Icons.square,
        'page': AnimatedContainerPage(),
      },
      {
        'title': 'AnimatedPositioned',
        'icon': Icons.move_to_inbox,
        'page': AnimatedListPage(),
      },
      {
        'title': 'Animated Positioned',
        'icon': Icons.move_to_inbox,
        'page': AnimatedPositionedPage(),
      },
      {
        'title': 'Tween Animation',
        'icon': Icons.animation,
        'page': const ScaleTweenAnimationBuilderDesign(),
      },
      {
        'title': 'Animation Controller',
        'icon': Icons.one_k,
        'page': AnimationControllerPage(),
      },
      {
        'title': 'Explicit Animations',
        'icon': Icons.sanitizer,
        'page': const ExplicitAnimations(),
      },
      {
        'title': 'Size Transition',
        'icon': Icons.animation_outlined,
        'page': const SizeTransitionPage(),
      },
      {
        'title': 'Animated Builder',
        'icon': Icons.transform,
        'page': const AnimatedBuilderPage(),
      },
      {
        'title': 'Dice',
        'icon': Icons.games,
        'page': DicePage(),
      }
      // Add more menu items here
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the selected page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40, color: Colors.blue),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
