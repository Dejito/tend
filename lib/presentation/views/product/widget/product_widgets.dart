import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/decoration_styles.dart';
import '../../widgets/titleText.dart';

Container giftVerificationContainer({required Widget widget}) {
  return Container(
    padding: EdgeInsets.all(16.w),
    decoration: AppDecorationStyle.boxDecoration,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget,
      ],
    ),
  );
}

Widget giftVerificationItem(
    {required String key,
      required String value,
    }) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleText(
           key, fontSize: 12, color: const Color(0xFF404040)),
        titleText(
          value,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ],
    ),
  );
}