import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/generate_recipe_cubnit/generate_recipe_cubit.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/helpers/app_extensions.dart';
import 'package:vcamp/core/helpers/input_validators.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/show_info_dialog.dart';
import 'package:vcamp/core/helpers/show_toast.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/widgets/custom_textfield.dart';
import 'package:vcamp/widgets/primary_button.dart';
import 'package:vcamp/widgets/screen_padding.dart';

class GenerateRecipeScreen extends StatefulWidget {
  const GenerateRecipeScreen({super.key});

  @override
  State<GenerateRecipeScreen> createState() => _GenerateRecipeScreenState();
}

class _GenerateRecipeScreenState extends State<GenerateRecipeScreen> {
  List<TextEditingController> _controllers = [
    TextEditingController(),
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<GenerateRecipeCubit, GenerateRecipeState>(
      listener: (context, state) {
        if (state is GeneratedRecipeState) {
          showInfoDialog(
              message: state.data.message ??
                  "Recipe Generation Is On Process. You'll Get Notified After Completion.",
              onOkPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.homeScreen,
                  (route) => false,
                );
              });
        } else if (state is RecipeGenerationFailedState) {
          showErrorToast(state.failure.message!);
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                locator<GenerateRecipeCubit>().generateRecipes(
                  _controllers.map((e) => e.text).toList(),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              fixedSize: const Size(double.maxFinite, 50),
              elevation: 0,
            ),
            child: Text(
              "Generate Recipe",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.keyboard_arrow_left_outlined),
            color: Colors.black,
          ),
          title: const Text('Generate Recipe',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: ScreenPadding(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  24.verticalSpace,
                  ..._controllers
                      .mapWithIndex(
                        (e, i) => CustomTextField(
                          controller: e,
                          validator: InputValidators.requiredValidator,
                          hintText: "Ingredient ${i + 1} Name",
                        ),
                      )
                      .toList(),
                  10.verticalSpace,
                  PrimaryButton(
                    buttonTitle: "Add New Ingredient",
                    onTap: () {
                      _controllers.add(TextEditingController());
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
