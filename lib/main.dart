import 'package:blackchinx/presentation/provider/auth_provider.dart';
import 'package:blackchinx/presentation/views/login/login_screen.dart';
import 'package:blackchinx/presentation/views/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider())
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(390, 884),
        child: MaterialApp(
          title: 'Tezda Shop',
          // navigatorKey: NavHelper.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          home: const LoginScreen(),
          routes: {
            // ProductsOverviewScreen.id: (context) => const ProductsOverviewScreen(),
            LoginScreen.route: (context) => const LoginScreen(),
            Signup.route: (context) => const Signup(),
          },
          // initialRoute: AppRoutes.initial,
          // onGenerateRoute: routes,
        ),
      ),
    );
  }
}
