
import 'package:flutter/material.dart';

void showLoadingIndicator(){
  EasyLoading.show(
      indicator: const CircularProgressIndicator(
        color: Colors.blueAccent,
      ),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true
  );
}

void dismissLoadingIndicator(){
  EasyLoading.dismiss();
}

