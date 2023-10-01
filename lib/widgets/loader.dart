import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vcamp/core/constants/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitHourGlass(
        color: AppColors.primaryColor,
        duration: Duration(seconds: 5),
      ),
    );
  }
}
