import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    print("build method called!");
    return Scaffold(
      appBar: AppBar(
        title: Text("S Studio"),
      ),
      body: Column(
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, provider, child) {
              return Slider(
                min: 0,
                max: 1,
                value: provider.value,
                onChanged: (newValue) {
                  provider.setValue(newValue);
                  print(newValue);
                },
              );
            },
          ),
          Consumer<ExampleOneProvider>(
            builder: (provider, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(value.value)),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
