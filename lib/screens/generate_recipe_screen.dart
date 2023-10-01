import 'package:flutter/material.dart';
import 'package:vcamp/widgets/custom_textfield.dart';

class GenerateRecipeScreen extends StatefulWidget {
  const GenerateRecipeScreen({super.key});

  @override
  State<GenerateRecipeScreen> createState() => _GenerateRecipeScreenState();
}

class _GenerateRecipeScreenState extends State<GenerateRecipeScreen> {
  List<TextEditingController> _controllers = [
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Generate Recipe",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _controllers
              .map(
                (e) => CustomTextField(
                  controller: e,
                  hintText: "Recipe Name",
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
