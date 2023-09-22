import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/provider/favorate_provider.dart';
import 'package:provider_pattern/screen/my_favorite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print("Favorite List Build() called");

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const MyFavourite();
                },
              ));
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10000,
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
