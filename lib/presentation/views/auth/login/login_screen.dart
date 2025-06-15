import 'package:blackchinx/data/models/request/auth/login_reqbody.dart';
import 'package:blackchinx/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth_widgets.dart';
import '../../widgets/elevated_bottom_button.dart';
import '../sign_up/sign_up.dart';
import '../../widgets/text_input.dart';
import '../../widgets/titleText.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  // bool isCheckedKeepLoggedIn = false;
  bool _obscurePassword = true;


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                logoImage(),
                titleText("Log In",
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    topPadding: 12,
                    bottomPadding: 12),
                titleText(
                  "Log In now to access diverse\nranges of product offerings",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  bottomPadding: 30,
                ),
                InputText(
                  controller: _emailController,
                  hint: "Email",
                  bottomPadding: 0,
                ),
                InputText(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                    hint: "Password",
                    keyboardType: TextInputType.visiblePassword,                  bottomPadding: 16,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                    )                ),
                MedBottomButton(
                  text: "Log in",
                  onPressed: () {
                    final loginReqBody = LoginRequestBody(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
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
      ),
    );
  }
}
