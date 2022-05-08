import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:reciperlich/data/models/models.dart';
import 'package:reciperlich/data/memory_repository.dart';



class MyRecipesList extends StatefulWidget {
  const MyRecipesList({Key? key}) : super(key: key);

  @override
  _MyRecipesListState createState() => _MyRecipesListState();
}

class _MyRecipesListState extends State<MyRecipesList> {
  List<Recipe> recipes = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildRecipeList(context),
    );
  }

  Widget _buildRecipeList(BuildContext context) {
    return Consumer<MemoryRepository>(builder: (context, repository, child) {
     recipes = repository.findAllRecipes();
      return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            final recipe = recipes[index];
            return SizedBox(
              height: 100,
              child: Slidable(
                key: ValueKey(index),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {},
                  ),
                  extentRatio: 0.25,
                  children: [
                    SlidableAction(
                        onPressed: (_) => deleteRecipe(repository, recipe),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      icon: Icons.delete,
                      label: 'Delete',
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {},
                  ),
                  extentRatio: 0.25,
                  children: [
                    SlidableAction(
                      onPressed: (_) => deleteRecipe(repository, recipe),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      icon: Icons.delete,
                      label: 'Delete',
                    )
                  ],
                ),
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CachedNetworkImage(
                            imageUrl: recipe.image ?? '',
                            height: 120,
                            width: 60,
                            fit: BoxFit.cover),
                        title: Text(recipe.label ?? ''),
                      ),
                    ),
                  ),
                ),
                // actions: <Widget>[
                //   IconSlideAction(
                //       caption: 'Delete',
                //       color: Colors.transparent,
                //       foregroundColor: Colors.black,
                //       iconWidget: const Icon(Icons.delete, color: Colors.red),
                //       // TODO 7
                //       onTap: () => deleteRecipe(repository, recipe)),
                // ],
                // secondaryActions: <Widget>[
                //   IconSlideAction(
                //       caption: 'Delete',
                //       color: Colors.transparent,
                //       foregroundColor: Colors.black,
                //       iconWidget: const Icon(Icons.delete, color: Colors.red),
                //       // TODO 8
                //       onTap: () => deleteRecipe(repository, recipe)),
                // ],
              ),
            );
          },
        );
      },
    );
    // TODO 9
  }

  void deleteRecipe(MemoryRepository repository, Recipe recipe) async {
    if (recipe.id != null) {
      repository.deleteRecipeIngredients(recipe.id!);
      repository.deleteRecipe(recipe);
      setState(() {});
    } else {
      debugPrint('Recipe id is null');
    }
  }
}
