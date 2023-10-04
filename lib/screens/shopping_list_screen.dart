import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/generate_meal_plan_cubit/generate_meal_plan_cubit.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';
import 'package:vcamp/widgets/loader.dart';

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Shopping List",
          ),
          elevation: 0,
        ),
        body: BlocBuilder<GenerateShoppingListCubit, GenerateShoppingListState>(
          builder: (context, state) {
            if (state is GeneratedShoppingListState) {
              if (state.mealPlan.entries.isEmpty) {
                return const Center(
                  child: Text("No Shopping List Found"),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: state.mealPlan.length,
                  itemBuilder: (context, index) {
                    final mealPlan = state.mealPlan;
                    final value = state.mealPlan.values.toList()[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: value["image_url"].toString(),
                            height: 105.h,
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                          ).withPlaceHolder(),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          mealPlan.keys.toList()[index],
                        ),
                        Text(
                          value["measurement"],
                        ),
                      ],
                    );
                  },
                ),
              );
            } else if (state is GeneratedShoppingListFailedState) {
              return Center(
                child: Text(
                  state.failure.message!,
                ),
              );
            }
            return const Center(
              child: Loader(),
            );
          },
        ));
  }
}
