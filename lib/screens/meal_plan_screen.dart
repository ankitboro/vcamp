import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/user_meal_plan_cubit/user_meal_plan_cubit.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';
import 'package:vcamp/widgets/meal_plan_widget.dart';
import 'package:vcamp/widgets/screen_padding.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  @override
  void initState() {
    locator<UserMealPlanCubit>().fetchUserMealPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meal Plan",
        ),
      ),
      body: BlocBuilder<UserMealPlanCubit, UserMealPlanState>(
        builder: (context, state) {
          if (state is UserMealPlanFetchedState) {
            return SingleChildScrollView(
              child: Column(children: [
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.sun
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.sun?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.sun
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.sun?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.sun?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.sun
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.sun?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.sun?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.sun
                          ?.dinner?.nutrition ??
                      [],
                ),
                //mon
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.mon
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.mon?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.mon
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.mon?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.mon?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.mon
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.mon?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.mon?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.mon
                          ?.dinner?.nutrition ??
                      [],
                ),
                //tue
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.tue?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.tue?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.tue?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.wed?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.wed?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.wed?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.tue?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.tue?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.tue?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.wed?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.wed?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.wed?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.tue?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.tue?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.tue?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.wed?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.wed?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.wed?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.tue?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.tue?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.tue?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.wed?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.wed?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.wed?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.tue?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.tue?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.tue?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.tue?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.tue
                          ?.dinner?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.imageUrl ??
                      "",
                  name: state.userMealPlan.data?.weekMealPlan?.wed?.breakfast
                          ?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.breakfast?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.lunch
                          ?.imageUrl ??
                      "",
                  name:
                      state.userMealPlan.data?.weekMealPlan?.wed?.lunch?.name ??
                          "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.lunch?.nutrition ??
                      [],
                ),
                MealPlanWidget(
                  imageUrl: state.userMealPlan.data?.weekMealPlan?.wed?.dinner
                          ?.imageUrl ??
                      "",
                  name: state
                          .userMealPlan.data?.weekMealPlan?.wed?.dinner?.name ??
                      "",
                  nutritionList: state.userMealPlan.data?.weekMealPlan?.wed
                          ?.dinner?.nutrition ??
                      [],
                ),
              ]),
            );
          } else if (state is UserMealPlanfetchErrorState) {
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
      ),
    );
  }
}
