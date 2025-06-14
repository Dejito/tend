import 'package:blackchinx/data/models/request/auth/create_user_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';
import '../../auth_widgets.dart';
import '../../widgets/elevated_bottom_button.dart';
import '../../widgets/text_input.dart';
import '../../widgets/titleText.dart';
import '../login/login_screen.dart';


class Signup extends StatefulWidget {
  static const route = '/sign-up';

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isCheckedKeepLoggedIn = false;

  final TextEditingController _usernameController =
  TextEditingController(text: '');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _showLoadingIndicator = false;
  bool _isFormValid = false;


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logoImage(),
              titleText(
                  "Sign up now to access unlimited products offering",
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  bottomPadding: 34,
                  topPadding: 14),
              InputText(
                hint: "Full name",
                bottomPadding: 0,
              ),
              InputText(
                hint: "Email",
                bottomPadding: 0,
              ),
              InputText(
                hint: "Set Password",
                bottomPadding: 0,
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              ),
              InputText(
                hint: "Confirm Password",
                bottomPadding: 16,
                suffixIcon: const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
              ),
              termsAndConditionsText(
                value: isCheckedKeepLoggedIn,
                onClickedChanged: (value) {
                  setState(() {
                    isCheckedKeepLoggedIn = value!;
                  });
                },
              ),
              MedBottomButton(
                text: "Sign up",
                onPressed: () {
                  final createUserReqBody = CreateUserRequestBody(
                      name: 'Oladeji Muhammed',
                      email: 'Deerealboy@gmail.com',
                      password: '1111',
                      avatar: 'https://picsum.photos/800');
                  authProvider.createUser(createUserReqBody);

                  !authProvider.isUserCreated ? Navigator.of(context).pushNamed(
                      LoginScreen.route) : null;
                  // context.push(AppRoutes.verifyEmail);
                },
                topMargin: 20,
              ),
              alreadyHaveAnAccountButton(
                      () {
                    Navigator.of(context).pushNamed(LoginScreen.route);
                    // context.go(AppRoutes.login);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
