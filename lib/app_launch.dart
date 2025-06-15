import 'package:blackchinx/presentation/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.instance;

class AppLaunch {

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    getIt.allowReassignment = true;
    await registerServices(getIt);
    ScreenUtil.ensureScreenSize();
  }

  Future<void> registerServices(ioc) async {
    setupAuthToken(ioc);
  }

}