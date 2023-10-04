import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/models/user_recipe_model.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipes recipe;
  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  RecipeDetailScreenState createState() => RecipeDetailScreenState();
}

class RecipeDetailScreenState extends State<RecipeDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          color: Colors.black,
        ),
        title: Text(widget.recipe.name ?? "Recipe Detail",
            style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Hero(
              tag: widget.recipe.id ?? "1",
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CachedNetworkImage(
                  imageUrl: widget.recipe.imageUrl ?? "",
                  height: 150.h,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ).withPlaceHolder(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: AppColors.primaryColor,
              tabs: const [
                Tab(text: 'Ingredients'),
                Tab(text: 'Nutrients'),
                Tab(text: 'Measurement'),
                Tab(text: 'Process'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: widget.recipe.ingredients?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.recipe.ingredients![index]),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: widget.recipe.nutrition?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.recipe.nutrition![index]),
                    );
                  },
                ),
                ListView.builder(
                  itemCount:
                      widget.recipe.measurements?.measurementDetails?.length,
                  itemBuilder: (context, index) {
                    MeasurementDetails detail =
                        widget.recipe.measurements!.measurementDetails![index];
                    return ListTile(
                      title: Text(
                        detail.item ?? '',
                      ),
                      subtitle: Text(
                        detail.amount ?? "",
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: widget.recipe.process?.processes?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Step ${index + 1}: ${widget.recipe.process!.processes![index]}",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
