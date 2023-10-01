import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';
import 'package:vcamp/widgets/screen_padding.dart';

class MealPlanWidget extends StatelessWidget {
  final String imageUrl;
  final List<String> nutritionList;
  final String name;
  const MealPlanWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.nutritionList,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sunday",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            10.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 0.3.sh,
                fit: BoxFit.cover,
              ).withPlaceHolder(),
            ),
            10.verticalSpace,
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            5.verticalSpace,
            ...nutritionList
                .map(
                  (e) => Text(e),
                )
                .toList(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
