import 'package:flutter/material.dart';

import 'package:flutter_ckt/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'extend_image.dart';

/// 缓存图片
Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry? margin,
}) {
  return getCacheImage(url);
  // return CachedNetworkImage(
  //   imageUrl: url,
  //   imageBuilder: (context, imageProvider) => Container(
  //     height: height.h,
  //     width: width.w,
  //     margin: margin,
  //     decoration: BoxDecoration(
  //       borderRadius: Radii.k6pxRadius,
  //       image: DecorationImage(
  //         image: imageProvider,
  //         fit: BoxFit.cover,
  //         // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
  //       ),
  //     ),
  //   ),
  //   placeholder: (context, url) {
  //     return Container(
  //       alignment: Alignment.center,
  //       child: CircularProgressIndicator(),
  //     );
  //   },
  //   errorWidget: (context, url, error) => Icon(Icons.error),
  // );
}
