import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/data.dart';
import 'circular_indicator.dart';
import 'pages/meals_page.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final pageController = PageController(
    viewportFraction: 0.55,
    initialPage: 1,
  );

  bool _animate = false;

  final currentPage = ValueNotifier<double>(1.0);

  void pageListener() {
    currentPage.value = pageController.page!;
  }

  @override
  void initState() {
    currentPage.value = 1.0;
    pageController.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.removeListener(pageListener);
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: const Color(0xFF573751),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            indicator:
                CircleTabIndicator(color: const Color(0xFF573751), radius: 2),
            indicatorColor: const Color(0xFF573751),
            unselectedLabelColor: Colors.grey,
            labelColor: const Color(0xFF573751),
            tabs: const [
              Tab(
                  child: Text(
                'fruits',
              )),
              Tab(
                  child: Text(
                'vegetables',
              )),
              Tab(
                  child: Text(
                'berries',
              )),
            ],
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: const Color(0xFF573751),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              color: const Color(0xFF573751),
            ),
          ],
        ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            TweenAnimationBuilder<double>(
              curve: Curves.easeInOut,
              tween: Tween(begin: 0, end: _animate ? 1 : 0),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: value * (-kBottomNavigationBarHeight - 30),
                  child: child!,
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30)),
                    color: Colors.white),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 64.0),
                    child: ValueListenableBuilder<double>(
                        valueListenable: currentPage,
                        builder: (context, currentPage, child) {
                          return PageView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            controller: pageController,
                            itemBuilder: (content, index) {
                              final Ingredient ingredient = ingredients[index];
                              var value = (currentPage - index).abs();
                              final lerpValue = lerpDouble(0.0, 1.0, value * 3);
                              var textColor = const Color(0xFF573751);
                              if (index == 1 || index == 4) {
                                textColor = const Color(0xFF83c4b0);
                              } else if (index == 2 || index == 5) {
                                textColor = const Color(0xFFf4c551);
                              }

                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      ingredient.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Opacity(
                                    opacity: (1 - lerpValue!).clamp(0.0, 1.0),
                                    child: Text(
                                      ingredient.name,
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: ingredients.length,
                          );
                        }),
                  ),
                ),
                //Expanded(flex: 1, child: nombres[page]),
                //Expanded(flex: 1, child: Center(child: nombres[page])),

                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _animate = true;
                    });
                    await Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                                opacity: animation, child: const MealsPage());
                          },
                        ));
                    setState(() {
                      _animate = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFf25869),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fixedSize: const Size(180, 50)),
                  child: const Text(
                    'View Meals',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ],
        ),
        bottomNavigationBar: TweenAnimationBuilder<double>(
          curve: Curves.easeInOut,
          tween: Tween(begin: 0, end: _animate ? 1 : 0),
          duration: Duration(milliseconds: _animate ? 250 : 750),
          builder: (context, value, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(pi / 2 * value),
              child: child,
            );
          },
          child: BottomNavigationBar(
            unselectedItemColor: const Color(0xFF877085),
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: 1,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.view_list_outlined,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Contactos',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
