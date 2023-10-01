import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcamp/blocs/generate_meal_plan_cubit/generate_meal_plan_cubit.dart';
import 'package:vcamp/core/helpers/service_locator.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  _generateShoppingList() {
    locator<GenerateShoppingListCubit>().generateShoppingList();
  }

  @override
  void initState() {
    _generateShoppingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GenerateShoppingListCubit, GenerateShoppingListState>(
      builder: (context, state) {
        if (state is GeneratedShoppingListState) {
          return ListView.separated(
            separatorBuilder: (context, state) => const Divider(),
            itemCount: state.mealPlan.keys.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    state.mealPlan.keys.toList()[index],
                  ),
                  Text(
                    state.mealPlan.toString(),
                  )
                ],
              );
            },
          );
        } else if (state is GeneratedShoppingListFailedState) {
          return Center(
            child: Text(
              state.failure.message!,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
