import 'package:flutter/material.dart';

import 'src/logic/bloc.dart';
import 'src/logic/data_provider.dart';
import 'src/presentattion/screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DataProvider(
      data: MealsBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ScreenOne(),
      ),
    );
  }
}
