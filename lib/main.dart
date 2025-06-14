import 'package:blackchinx/app_launch.dart';
import 'package:blackchinx/presentation/provider/auth_provider.dart';
import 'package:blackchinx/presentation/provider/products_provider.dart';
import 'package:blackchinx/presentation/views/auth/login/login_screen.dart';
import 'package:blackchinx/presentation/views/auth/sign_up/sign_up.dart';
import 'package:blackchinx/presentation/views/product/screens/product_detail_screen.dart';
import 'package:blackchinx/presentation/views/product/screens/product_overview_screen.dart';
import 'package:blackchinx/presentation/views/product/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  AppLaunch().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: ProductsProvider()),
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
          home:  const LoginScreen(),
          builder: EasyLoading.init(),
          routes: {
            // ProductsOverviewScreen.id: (context) => const ProductsOverviewScreen(),
            LoginScreen.route: (context) => const LoginScreen(),
            Signup.route: (context) => const Signup(),
            ProductsOverviewScreen.id: (context) => const ProductsOverviewScreen(),
            ProductDetailScreen.id: (context) => const ProductDetailScreen(),
            // UserProductsScreen.id: (context) => const UserProductsScreen(),
            // EditProductScreen.id: (context) => const EditProductScreen(),
            // AuthScreen.id: (context) => const AuthScreen(),
          },
          // initialRoute: AppRoutes.initial,
          // onGenerateRoute: routes,
        ),
      ),
    );
  }
}
