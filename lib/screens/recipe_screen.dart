import 'package:flutter/material.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/routes/app_routes.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              "Recipes",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            RecipeCard(),
            RecipeCard(),
            RecipeCard(),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.recipeDetailScreen);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.network(
                "https://v-camp.s3.amazonaws.com/recipe/recipe.jpg",
                height: 150,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("Recipe name"),
            ),
            SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: ["Ingr1", "Ingr2", "Ingr3", "Ingr4", "Ingr5", "Ingr6"]
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Chip(
                          label:
                              Text(e, style: TextStyle(color: Colors.white70)),
                          backgroundColor:
                              AppColors.primaryColor.withOpacity(0.7),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
