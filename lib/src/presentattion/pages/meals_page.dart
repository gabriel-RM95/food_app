import 'package:flutter/material.dart';

import '../widgets/my_grid_view.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: TweenAnimationBuilder<double>(
          curve: Curves.easeOut,
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) {
            return Transform.translate(
                offset: Offset(50 * (1 - value), 0.0),
                child: Opacity(opacity: value, child: child));
          },
          child: const BackButton(
            color: Color(0xFF573751),
          ),
        ),
        centerTitle: true,
        title: TweenAnimationBuilder<double>(
          curve: Curves.easeOut,
          tween: Tween(begin: 0.0, end: 2.0),
          duration: const Duration(milliseconds: 900),
          builder: (context, value, child) {
            return Transform.translate(
                offset: Offset(value < 1.0 ? 40 : 40 * (2 - value), 0.0),
                child: Opacity(
                    opacity: value < 1.0 ? 0.0 : value - 1, child: child));
          },
          child: const Text(
            'Meals',
            style: TextStyle(color: Color(0xFF573751)),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: const Color(0xFF573751),
          ),
        ],
      ),
      body: const MyGridView(),
    );
  }
}
