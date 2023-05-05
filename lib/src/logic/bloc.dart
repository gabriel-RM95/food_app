import 'dart:async';

import 'package:food_app/src/data/data.dart';

class MealsBloc {
  Stream<List<MealItem>> get listStream async* {
    for (var i = 0; i < meals.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      yield meals.sublist(0, i + 1);
    }
  }

  Stream<List<Ingredient>> get ingredientsStream async* {
    await Future.delayed(const Duration(milliseconds: 600));
    for (var i = 0; i < ingredients.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      yield ingredients.sublist(0, i + 1);
    }
  }

  /* StreamController<int> _streamController = StreamController<int>();
  Stream<int> get myStream => _streamController.stream;

  MealsBloc() {
    listStream.listen((list) => _streamController.add(list.length));
  }

  void dispose() {
    _streamController.close();
  } */
}
