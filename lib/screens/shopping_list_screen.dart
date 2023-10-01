import 'package:flutter/material.dart';
import 'package:vcamp/models/weekly_shopping_list_model.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text(
              "Shopping list for a week",
              style: TextStyle(fontSize: 20),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: shoppingList.entries.length,
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemBuilder: (context, index) {
                var listItem = shoppingList.entries.toList()[index];
                return ListTile(
                  title: Text(listItem.key),
                  trailing: Text(listItem.value),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
