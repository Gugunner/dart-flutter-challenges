/*
 * Copyright (c) 2020 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/recipe_model.dart';
import '../../shared_widgets/app_bar_widget.dart';
import 'widgets/pill_widget.dart';
import 'widgets/sliver_sub_header.dart';

class RecipePage extends StatelessWidget {
  final RecipeModel recipe;

  const RecipePage(this.recipe, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarWidget(
            text: recipe.title,
            imagePath: recipe.mainImagePath,
          ),
          SliverSubHeader
            (text: 'Instruction',
              backgroundColor: recipe.itemColor
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                recipe.instructions,
                style: const TextStyle(
                  color: AppColors.navy,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverSubHeader(
              text: 'Ingredients',
              backgroundColor: recipe.itemColor
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                childAspectRatio: 3,
                mainAxisExtent: 50
              ),
              delegate: SliverChildBuilderDelegate(
                  (context, index) => PillWidget(recipe.ingredients[index]),
                      childCount: recipe.ingredients.length,
              ),
            ),
          ),
          SliverSubHeader(
              text: 'Numbers',
              backgroundColor: recipe.itemColor,
          ),
		  SliverPadding(
        padding: const EdgeInsets.all(15),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4,
          ),
          delegate: SliverChildBuilderDelegate(
              (context, index) => PillWidget(recipe.details[index]),
            childCount: recipe.details.length,
          ),
        ),
      ),
          SliverFillRemaining(
            child: Container(),
          )
        ],
      ),
    );
  }
}
