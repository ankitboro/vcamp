import 'package:flutter/material.dart';
import 'package:vcamp/core/constants/app_colors.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

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

  var ingredients = ["Ingredient 1", "Ing2", "Ing3", "Ing4"];

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
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(ingredients[index]),
                    );
                  },
                ),
                Center(child: Text('Measurement Tab Content')),
                Center(child: Text('Process Tab Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
