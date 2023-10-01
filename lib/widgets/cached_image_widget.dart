import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

extension ImageExtension on CachedNetworkImage {
  withPlaceHolder() {
    String cacheKey = imageUrl.split("?").first;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      placeholder: (context, url) => getPlaceHolder(
        context,
        url,
      ),
      fit: fit,
      cacheKey: cacheKey,
      errorWidget: (context, url, error) =>
          // hasShimmerPlaceholder
          // ? shimmerPlaceHolder(
          //     context,
          //     url,
          //     heightForShimmer: heightForShimmer,
          //     widthForShimmer: widthForShimmer,
          //   )
          // :
          getPlaceHolder(
        context,
        url,
      ),
    );
  }
}

Widget getPlaceHolder(BuildContext context, String url) {
  return Image.asset(
    "assets/placeholder.png",
    fit: BoxFit.cover,
    height: 150,
  );
}
