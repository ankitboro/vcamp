import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/user_meal_plan_cubit/user_meal_plan_cubit.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/show_info_dialog.dart';
import 'package:vcamp/core/helpers/show_toast.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/core/services/api_services.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';
import 'package:vcamp/widgets/custom_text_tabbar_widget.dart';
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
      floatingActionButton: GestureDetector(
        onTap: () async {
          // context.read<UserMealPlanCubit>().generateUserMealPlan();
          final response = await locator<ApiServices>().generateUserMealPlan();
          response.fold((l) {
            showSuccessToast(l.message.toString());
          }, (r) {
            showInfoDialog(
                message: r.message.toString(),
                onOkPressed: () {
                  Navigator.of(context).pop();
                });
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.teal,
          ),
          child: const Text("Generate Meal",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Meal Plan",
        ),
        elevation: 0,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     context.read<UserMealPlanCubit>().generateUserMealPlan();
          //   },
          //   icon: const Icon(Icons.food_bank_outlined),
          // ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<UserMealPlanCubit, UserMealPlanState>(
        builder: (context, state) {
          if (state is UserMealPlanFetchedState) {
            return state.userMealPlan.data?.weekMealPlan?.sun == null
                ? const Center(
                    child: Text("No meal plans"),
                  )
                : CustomTabbarWidget(
                    titles: const [
                      "Sunday",
                      "Monday",
                      "Tuesday",
                      "Wednesday",
                      "Thursday",
                      "Friday",
                      "Saturday"
                    ],
                    bodies: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            MealPlanWidget(
                              dayName: "Breakfast",
                              imageUrl: state.userMealPlan.data?.weekMealPlan
                                      ?.sun?.breakfast?.imageUrl ??
                                  "",
                              name: state.userMealPlan.data?.weekMealPlan?.sun
                                      ?.breakfast?.name ??
                                  "",
                              nutritionList: state
                                      .userMealPlan
                                      .data
                                      ?.weekMealPlan
                                      ?.sun
                                      ?.breakfast
                                      ?.nutrition ??
                                  [],
                            ),
                            MealPlanWidget(
                              dayName: "Lunch",
                              imageUrl: state.userMealPlan.data?.weekMealPlan
                                      ?.sun?.lunch?.imageUrl ??
                                  "",
                              name: state.userMealPlan.data?.weekMealPlan?.sun
                                      ?.lunch?.name ??
                                  "",
                              nutritionList: state.userMealPlan.data
                                      ?.weekMealPlan?.sun?.lunch?.nutrition ??
                                  [],
                            ),
                            MealPlanWidget(
                              dayName: "Dinner",
                              imageUrl: state.userMealPlan.data?.weekMealPlan
                                      ?.sun?.dinner?.imageUrl ??
                                  "",
                              name: state.userMealPlan.data?.weekMealPlan?.sun
                                      ?.dinner?.name ??
                                  "",
                              nutritionList: state.userMealPlan.data
                                      ?.weekMealPlan?.sun?.dinner?.nutrition ??
                                  [],
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.mon
                                    ?.breakfast?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.mon
                                    ?.breakfast?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.mon?.breakfast?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Lunch",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.mon
                                    ?.lunch?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.mon
                                    ?.lunch?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.mon?.lunch?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.mon
                                    ?.dinner?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.mon
                                    ?.dinner?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.mon?.dinner?.nutrition ??
                                [],
                          ),
                        ]),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                                    ?.breakfast?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.tue
                                    ?.breakfast?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.tue?.breakfast?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Lunch",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                                    ?.lunch?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.tue
                                    ?.lunch?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.tue?.lunch?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.tue
                                    ?.dinner?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.tue
                                    ?.dinner?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.tue?.dinner?.nutrition ??
                                [],
                          ),
                        ]),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                                    ?.breakfast?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.wed
                                    ?.breakfast?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.wed?.breakfast?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                                    ?.lunch?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.wed
                                    ?.lunch?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.wed?.lunch?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.wed
                                    ?.dinner?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.wed
                                    ?.dinner?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.wed?.dinner?.nutrition ??
                                [],
                          ),
                        ]),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.thu
                                    ?.breakfast?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.thu
                                    ?.breakfast?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.thu?.breakfast?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Lunch",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.thu
                                    ?.lunch?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.thu
                                    ?.lunch?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.thu?.lunch?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.thu
                                    ?.dinner?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.thu
                                    ?.dinner?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.thu?.dinner?.nutrition ??
                                [],
                          ),
                        ]),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.fri
                                    ?.breakfast?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.fri
                                    ?.breakfast?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.fri?.breakfast?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.fri
                                    ?.lunch?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.fri
                                    ?.lunch?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.fri?.lunch?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.fri
                                    ?.dinner?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.fri
                                    ?.dinner?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.fri?.dinner?.nutrition ??
                                [],
                          ),
                        ]),
                      ),
                      SingleChildScrollView(
                        child: Column(children: [
                          MealPlanWidget(
                            dayName: "Breakfast",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.sat
                                    ?.breakfast?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.sat
                                    ?.breakfast?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.sat?.breakfast?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Lunch",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.sat
                                    ?.lunch?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.sat
                                    ?.lunch?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.sat?.lunch?.nutrition ??
                                [],
                          ),
                          MealPlanWidget(
                            dayName: "Dinner",
                            imageUrl: state.userMealPlan.data?.weekMealPlan?.sat
                                    ?.dinner?.imageUrl ??
                                "",
                            name: state.userMealPlan.data?.weekMealPlan?.sat
                                    ?.dinner?.name ??
                                "",
                            nutritionList: state.userMealPlan.data?.weekMealPlan
                                    ?.sat?.dinner?.nutrition ??
                                [],
                          ),
                        ]),
                      ),
                    ],
                  );
          } else if (state is UserMealPlanfetchErrorState) {
            return Center(
              child: Text(
                state.failure.message!,
              ),
            );
          } else if (state is UserMealPlanGenerateFailureState) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  state.errorMsg,
                ),
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
