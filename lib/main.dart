import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/provider/example_one_provider.dart';
import 'package:provider_pattern/provider/favorate_provider.dart';
import 'package:provider_pattern/screen/example_one_provider.dart';
import 'package:provider_pattern/screen/favorite_screen.dart';

import 'model/couter_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterModel()),
      ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
      ChangeNotifierProvider(
        create: (_) => FavouriteItemProvider(),
      )
    ],
    child: MaterialApp(
      home: FavouriteScreen(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("widget build method called");
    final counter = Provider.of<CounterModel>(context, listen: false);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<CounterModel>(
                builder: (BuildContext context, value, Widget? child) {
                  print("text widget build");
                  return Text("Counter ${value.count}");
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
