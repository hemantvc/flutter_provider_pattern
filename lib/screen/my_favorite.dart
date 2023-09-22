import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorate_provider.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Item'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                  builder: (context, provider, child) {
                    return ListTile(
                      onTap: () {
                        print("On tap $index");
                        if (provider.selectedItem.contains(index)) {
                          provider.removeItem(index);
                        } else {
                          provider.addItem(index);
                        }
                      },
                      title: Text("Item  $index"),
                      trailing: provider.selectedItem.contains(index)
                          ? const Icon(Icons.favorite, color: Colors.green)
                          : const Icon(Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
