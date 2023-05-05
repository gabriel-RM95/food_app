import 'package:flutter/material.dart';
import 'package:food_app/src/data/data.dart';

class IngredientListTile extends StatelessWidget {
  const IngredientListTile({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 187),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(50 * (1 - value), 0.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
              child: ListTile(
                  leading: AspectRatio(
                    aspectRatio: 1,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            ingredient.image,
                          ),
                        )),
                  ),
                  title: Text(
                    ingredient.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    ingredient.description,
                    style: const TextStyle(color: Colors.grey),
                  )),
            ),
          );
        });
  }
}
