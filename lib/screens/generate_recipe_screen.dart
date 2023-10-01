import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/generate_recipe_cubnit/generate_recipe_cubit.dart';
import 'package:vcamp/core/helpers/input_validators.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/helpers/show_info_dialog.dart';
import 'package:vcamp/core/helpers/show_toast.dart';
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
          );
        } else if (state is RecipeGenerationFailedState) {
          showErrorToast(state.failure.message!);
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: PrimaryButton(
          buttonTitle: "Generate Recipe",
          isWidthLimited: true,
          onTap: () {
            if (_formKey.currentState!.validate()) {
              locator<GenerateRecipeCubit>().generateRecipes(
                _controllers.map((e) => e.text).toList(),
              );
            }
          },
        ),
        appBar: AppBar(
          title: const Text(
            "Generate Recipe",
          ),
        ),
        body: Form(
          key: _formKey,
          child: ScreenPadding(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  10.verticalSpace,
                  ..._controllers
                      .map(
                        (e) => CustomTextField(
                          controller: e,
                          validator: InputValidators.requiredValidator,
                          hintText: "Recipe Name",
                        ),
                      )
                      .toList(),
                  10.verticalSpace,
                  PrimaryButton(
                    buttonTitle: "Add New Recipe",
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
