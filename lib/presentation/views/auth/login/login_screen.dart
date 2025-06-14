import 'package:blackchinx/data/models/request/auth/login_reqbody.dart';
import 'package:blackchinx/presentation/provider/auth_provider.dart';
import 'package:blackchinx/presentation/views/product/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth_widgets.dart';
import '../../widgets/elevated_bottom_button.dart';
import '../../auth_widgets.dart';
import '../sign_up/sign_up.dart';
import '../../widgets/elevated_bottom_button.dart';
import '../../widgets/text_input.dart';
import '../../widgets/titleText.dart';


class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isCheckedKeepLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoImage(),
              titleText("Log In",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  topPadding: 12,
                  bottomPadding: 12),
              titleText(
                "Log In now to access diverse\nranges of product offerings",
                fontSize: 16,
                textAlign: TextAlign.center,
                bottomPadding: 30,
              ),
              InputText(
                hint: "Email",
                bottomPadding: 0,
              ),
              InputText(
                hint: "Password",
                bottomPadding: 16,
                suffixIcon: const Icon(Icons.visibility_off_outlined),
              ),


              MedBottomButton(
                text: "Log in",
                onPressed: () {
                  final loginReqBody = LoginRequestBody(email: 'Deerealboy@gmail.com', password: '1111');
                  authProvider.login(loginReqBody, context);
                },
                topMargin: 30,
                bottomMargin: 12,
              ),
              newHereButton(() {
                Navigator.of(context).pushNamed(Signup.route);
                // context.go(AppRoutes.signup);
              })
            ],
          ),
        ),
      ),
    );
  }
}
