import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../logic/bloc.dart';
import '../widgets/ingredient_listtile.dart';

class DetailsPage extends StatefulWidget {
  final MealItem meal;
  const DetailsPage({Key? key, required this.meal}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _nameAnimation,
      _oilAnimation,
      _caloriesAnimation,
      _sugarlessAnimation,
      _grammesAnimation,
      _ratingAnimation,
      _ingredientsAnimation,
      _xScaleButtonAnimation,
      _yScaleButtonAnimation;

  final bloc = MealsBloc();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _nameAnimation =
        CurveTween(curve: const Interval(5 / 16, 8 / 16, curve: Curves.easeOut))
            .animate(_controller);

    _oilAnimation =
        CurveTween(curve: const Interval(6 / 16, 9 / 16, curve: Curves.easeOut))
            .animate(_controller);

    _caloriesAnimation = CurveTween(
            curve: const Interval(7 / 16, 10 / 16, curve: Curves.easeOut))
        .animate(_controller);

    _sugarlessAnimation = CurveTween(
            curve: const Interval(8 / 16, 11 / 16, curve: Curves.easeOut))
        .animate(_controller);

    _grammesAnimation = CurveTween(
            curve: const Interval(9 / 16, 12 / 16, curve: Curves.easeOut))
        .animate(_controller);

    _ratingAnimation = CurveTween(
            curve: const Interval(10 / 16, 13 / 16, curve: Curves.easeOut))
        .animate(_controller);

    _ingredientsAnimation = CurveTween(
            curve: const Interval(11 / 16, 14 / 16, curve: Curves.easeOut))
        .animate(_controller);

    _xScaleButtonAnimation =
        CurveTween(curve: const Interval(0.0, 0.48, curve: Curves.easeInOut))
            .animate(_controller);

    _yScaleButtonAnimation =
        CurveTween(curve: const Interval(0.52, 1.0, curve: Curves.easeInOut))
            .animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF573751),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const BackButton(
          color: Color(0xFF573751),
        ),
        centerTitle: true,
        title: TweenAnimationBuilder<double>(
          curve: Curves.easeOut,
          tween: Tween(begin: 0.0, end: 2.0),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, child) {
            return Transform.translate(
                offset: Offset(value < 1.0 ? 40 : 40 * (2 - value), 0.0),
                child: Opacity(
                    opacity: value < 1.0 ? 0.0 : value - 1, child: child));
          },
          child: const Text(
            'Vegan Meal',
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
      body: Column(
        children: [
// First Half
          WillPopScope(
            onWillPop: () async {
              _controller.reverse(from: 1.0);
              return true;
            },
            child: Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final transformedValue =
                          Curves.easeOut.transform(_controller.value);
                      return Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: -(size.height / 2 - kToolbarHeight + 50) *
                            (1 - transformedValue),
                        child: child!,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedBuilder(
                        animation: _nameAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset:
                                Offset(50 * (1 - _nameAnimation.value), 0.0),
                            child: Opacity(
                                opacity: _nameAnimation.value, child: child),
                          );
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: size.width * .13, top: 16),
                          child: Text(
                            widget.meal.name,
                            style: const TextStyle(
                              color: Color(0xFF83c4b0),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(
                                            50 * (1 - _oilAnimation.value),
                                            0.0),
                                        child: Opacity(
                                          opacity: _oilAnimation.value,
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/02_Íconos/icons8_drop_of_blood_50px.png',
                                                height: 30,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                widget.meal.oil,
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(
                                            50 * (1 - _caloriesAnimation.value),
                                            0.0),
                                        child: Opacity(
                                          opacity: _caloriesAnimation.value,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/02_Íconos/icons8_gas_48px_1.png',
                                                height: 30,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                '${widget.meal.calories} Calories',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(
                                            50 *
                                                (1 - _sugarlessAnimation.value),
                                            0.0),
                                        child: Opacity(
                                          opacity: _sugarlessAnimation.value,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/02_Íconos/icons8_delete_52px.png',
                                                height: 30,
                                                color: const Color(0xFF573751),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                widget.meal.sugarless
                                                    ? 'Sugarless'
                                                    : 'Contains Sugar',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox.shrink(),
                                      Transform.translate(
                                        offset: Offset(
                                            50 * (1 - _grammesAnimation.value),
                                            0.0),
                                        child: Opacity(
                                          opacity: _grammesAnimation.value,
                                          child: Text(
                                            '${widget.meal.grammes}g',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF573751),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(
                                            50 * (1 - _ratingAnimation.value),
                                            0.0),
                                        child: Opacity(
                                          opacity: _ratingAnimation.value,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/02_Íconos/icons8_star_48px.png',
                                                height: 30,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                widget.meal.rating.toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Color(0xFF573751),
                                                ),
                                              ),
                                              Text(
                                                ' (${widget.meal.reviews})',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                            Hero(
                              tag: widget.meal.name,
                              flightShuttleBuilder: flightShuttleBuilder,
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..translate(50.0)
                                  ..scale(1.8)
                                  ..rotateZ(pi / 2),
                                child: Image.asset(
                                  widget.meal.image,
                                  width: 150,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
// Second Half
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _ingredientsAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset:
                              Offset(50 * (1 - _ratingAnimation.value), 0.0),
                          child: child,
                        );
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.only(left: 32.0, top: 32, bottom: 16),
                        child: Text(
                          'Ingredients',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<Ingredient>>(
                          stream: bloc.ingredientsStream,
                          builder: (context, snapshot) {
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                final ingredient =
                                    widget.meal.ingredients[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          index == meals.length ? 64.0 : 0.0),
                                  child: IngredientListTile(
                                      ingredient: ingredient),
                                );
                              },
                            );
                          }),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..scale(
                                _xScaleButtonAnimation.value,
                                _yScaleButtonAnimation.value < 0.05
                                    ? 0.05
                                    : _yScaleButtonAnimation.value),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                foregroundColor: const Color(0xFFf25869),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                fixedSize: const Size(180, 50)),
                            child: Opacity(
                                opacity: _yScaleButtonAnimation.value,
                                child: const Text('Add to Order')),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget flightShuttleBuilder(flightContext, animation, flightDirection,
      fromHeroContext, toHeroContext) {
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset(
        widget.meal.image,
        width: 150,
      ),
      builder: (context, child) {
        final scale = lerpDouble(1.5, 1.8, animation.value);
        return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(scale)
              ..translate(27.5 * animation.value)
              ..rotateZ(pi / 2 * animation.value),
            child: child);
      },
    );
  }
}
