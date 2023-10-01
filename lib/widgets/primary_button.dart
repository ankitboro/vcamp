import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final bool isWidthLimited;
  final Function()? onTap;
  final String buttonTitle;
  final Color? buttonBackgroundColor;
  const PrimaryButton({
    super.key,
    this.isWidthLimited = false,
    required this.buttonTitle,
    this.buttonBackgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          color: buttonBackgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
        width: isWidthLimited ? null : double.infinity,
        alignment: isWidthLimited ? null : Alignment.center,
        child: Text(
          buttonTitle,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
