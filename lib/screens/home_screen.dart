import 'package:flutter/material.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/screens/profile_screen.dart';
import 'package:vcamp/screens/recipe_screen.dart';
import 'package:vcamp/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = const [
    RecipeScreen(),
    RecipeScreen(),
    ShoppingListScreen(),
    ShoppingListScreen(),
    // ShoppingListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ingredients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '', // Empty label for the middle floating action button
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Shop List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const HomeScreenAddBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeScreenAddBottomSheet extends StatelessWidget {
  const HomeScreenAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.generateRecipeScreen);
              },
              title: const Text(
                "Add Recipe",
              ),
            ),
            const ListTile(
              title: Text("Create Meal Plan"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.shoppingListScreen,
                );
              },
              title: const Text(
                "Generate Shopping List",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
