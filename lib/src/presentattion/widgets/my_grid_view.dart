import 'package:flutter/material.dart';
import 'package:food_app/src/logic/data_provider.dart';

import '../../data/data.dart';
import '../../logic/bloc.dart';
import 'meal_card.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  // final bloc = MealsBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final MealsBloc bloc = DataProvider.of(context);

    return Stack(
      children: [
        Container(
          height: size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
          final itemHeight = width / 2 / .7;
          final height = constraints.maxHeight + itemHeight;
          return OverflowBox(
            minHeight: height,
            maxHeight: height,
            child: StreamBuilder<List<MealItem>>(
                stream: bloc.listStream,
                builder: (context, snapshot) {
                  return GridView.builder(
                    padding: EdgeInsets.only(
                      left: size.width * .025,
                      right: size.width * .025,
                      top: itemHeight / 2 + size.width * .04,
                      bottom: meals.length.isOdd
                          ? itemHeight / 2 - size.width * .04
                          : itemHeight - size.width * .04,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                    ),
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return Transform.translate(
                        offset: Offset(
                            0.0,
                            index.isOdd
                                ? (itemHeight - size.width * .04) / 2
                                : 0.0),
                        child: MealCard(meal: meal),
                      );
                    },
                  );
                }),
          );
        }),
        /*  StreamBuilder(
          stream: bloc.myStream,
          builder: (context, snapshot) {
            return Text(snapshot.data.toString());
          },
        ) */
      ],
    );
  }
}
