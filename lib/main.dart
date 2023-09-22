import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/provider/example_one_provider.dart';
import 'package:provider_pattern/screen/ExampleOneProvider.dart';

import 'model/couter_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CounterModel()),
      ChangeNotifierProvider(create: (_) => ExampleOneProvider())
    ],
    child: MaterialApp(
      home: ExampleOne(),
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
