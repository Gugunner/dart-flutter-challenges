import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';


import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
        builder: (context, groceryManager, child) {
          if (groceryManager.groceryItems.isNotEmpty) {
            return GroceryListScreen(groceryManager: groceryManager);
          } else {
            return const EmptyGroceryScreen();
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final groceryManager = Provider.of<GroceryManager>(
            context,
            listen: false,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                  onCreate: (item) {
                    groceryManager.addItem(item);
                    Navigator.pop(context);
                  },
                  onUpdate: (item) {

                  }
              )
            )
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }
}