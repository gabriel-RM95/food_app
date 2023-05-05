import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../pages/details_page.dart';

class MealCard extends StatelessWidget {
  final MealItem meal;

  const MealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TweenAnimationBuilder<double>(
      curve: Curves.easeOut,
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 250),
      builder: (context, value, child) {
        return Transform(
          transform: Matrix4.identity()..scale(value, 1),
          alignment: Alignment.centerRight,
          child: Card(
            elevation: 15,
            margin: EdgeInsets.symmetric(
                horizontal: size.width * .05, vertical: size.width * .1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    transitionDuration: const Duration(milliseconds: 1000),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 1000),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                          opacity: animation, child: DetailsPage(meal: meal));
                    },
                  )),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..translate(50 * (1 - value), -25)
                      ..rotateZ(pi / 2 * (1 - value)),
                    child: child,
                  );
                },
                child: Hero(
                  tag: meal.name,
                  child: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      meal.image,
                      width: 150,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    meal.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ),
                Text(
                  '${meal.grammes}g',
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox.shrink(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index != 4 ? Colors.yellow : Colors.grey[400],
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
