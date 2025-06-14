import 'package:blackchinx/presentation/viewmodel/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/bloc_observer/bloc_observer.dart';

GetIt getIt = GetIt.instance;

class AppLaunch {

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    getIt.allowReassignment = true;
    await registerServices(getIt);
    ScreenUtil.ensureScreenSize();
  }

  Future<void> registerServices(ioc) async {
    setUpEndpointCalls();
    setupAuthToken(ioc);
    // setupSharedServices(ioc);
  }

}