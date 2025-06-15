import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/decoration_styles.dart';
import '../../widgets/titleText.dart';

Container productDetailContainer({required Widget widget}) {
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

Widget productDetailItem(
    {required String key,
      required String value,
    }) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // so wrapped text starts from top
      children: [
        titleText(
          key,
          fontSize: 12,
          color: const Color(0xFF404040),
        ),
        const SizedBox(width: 8), // spacing between key and value
        Expanded(
          child: titleText(
            value,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            textAlign: TextAlign.right,
            overflow: TextOverflow.visible,
            maxLines: null,
          ),
        ),
      ],
    ),
  );
}