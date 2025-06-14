
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showEaseLoadingIndicator(){
  EasyLoading.show(
      indicator: const CircularProgressIndicator(
        color: Colors.blueAccent,
      ),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false
  );
}

void dismissLoadingIndicator(){
  EasyLoading.dismiss();
}

