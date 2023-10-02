import 'package:flutter/material.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/models/user_recipe_model.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        title:
            const Text('Recipe Detail', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: AppColors.primaryColor,
              tabs: const [
                Tab(text: 'Ingredients'),
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
