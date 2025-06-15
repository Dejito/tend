import 'package:blackchinx/presentation/views/widgets/flutter_toast.dart';
import 'package:blackchinx/presentation/views/widgets/titleText.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/decoration_styles.dart';



Widget newHereButton(Function() onClickedSignup) {
  return Container(
    margin: EdgeInsets.only(top: 12.h),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        titleText(
          "You're new here? ",
          fontSize: 12,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w300,
        ),
        GestureDetector(
          onTap: onClickedSignup,
          child: titleText(
            "Sign Up",
            fontSize: 12,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget alreadyHaveAnAccountButton(Function() onClickedSignup) {
  return Container(
    margin: EdgeInsets.only(top: 24.h),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        titleText(
          "Already have an account? ",
          fontSize: 12,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w300,
        ),
        GestureDetector(
          onTap: onClickedSignup,
          child: titleText(
            "Sign In",
            fontSize: 12,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget logoImage() {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      AppImages.brandLogo,
      height: 80.h,
    ),
  );
}

Widget termsAndConditionsText({
  required bool value,
  required Function(bool?) onClickedChanged,
}) {
  return Row(
    children: [
      Checkbox(
        checkColor: AppColors.white,
        activeColor: AppColors.primaryColor,
        value: value,
        onChanged: onClickedChanged,
      ),
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: "Do you agree with our ",
          style: GoogleFonts.alegreya(
            color: Colors.black,
            fontSize: 13,
          ),
          children: [
            TextSpan(
              text: 'Terms & Conditions',
              style: GoogleFonts.alegreya(
                fontSize: 13.sp,
                color: const Color(0xFF2957C5),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    ],
  );
}



Widget profileAvatar(String imageUrl) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.h),
    child: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular profile image
          CircleAvatar(
            radius: 80.w,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image),
              ),
            ),
          ),

          // Camera icon overlay
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                showToast(message: "Backend provider doesn't have update image feature");
              },
              child: Container(
                decoration: AppDecorationStyle.boxDecoration,
                padding: const EdgeInsets.all(6),
                child: Icon(
                  Icons.camera_alt,
                  size: 15.w,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
