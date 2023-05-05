import 'package:flutter/material.dart';

import 'bloc.dart';

class DataProvider extends InheritedWidget {
  final MealsBloc data;

  const DataProvider({super.key, required this.data, required Widget child})
      : super(child: child);

  static MealsBloc of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<DataProvider>()!.data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
