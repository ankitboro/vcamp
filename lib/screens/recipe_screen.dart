import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vcamp/blocs/user_recipe_cuibit/user_recipe_cubit.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/models/user_recipe_model.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';
import 'package:vcamp/widgets/loader.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserRecipeCubit>().fetchUserRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Recipes"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserRecipeCubit, UserRecipeState>(
              builder: (context, state) {
                if (state is UserRecipeFetchedState) {
                  final recipeList = state.userRecipes.data?.recipes;
                  if (recipeList != null) {
                    if (recipeList.isEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * .8,
                        child: const Center(child: Text("No recipes found!")),
                      );
                    }
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recipeList.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          recipe: recipeList[index],
                        );
                      },
                    );
                  }
                }
                if (state is UserRecipeFetchInProgress) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .8,
                    child: const Loader(),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipes recipe;
  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.recipeDetailScreen,
          arguments: recipe,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Hero(
                tag: recipe.id ?? "1",
                child: CachedNetworkImage(
                  imageUrl: recipe.imageUrl ?? "",
                  height: 140.h,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ).withPlaceHolder(),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(recipe.name.toString()),
            ),
            SizedBox(height: 4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: recipe.ingredients!
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
