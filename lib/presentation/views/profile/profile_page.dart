import 'package:blackchinx/presentation/views/widgets/titleText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth_widgets.dart';
import '../widgets/elevated_bottom_button.dart';
import '../widgets/text_input.dart';

class ProfilePage extends StatelessWidget {
  static const route = '/profile-page';

  ProfilePage({super.key});

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleText("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            profileAvatar(),
            InputText(
              title: "Full Name",
              hint: 'e.g. Ogunrinde Blessing',
              controller: nameController,
              bottomPadding: 30,
            ),
            InputText(
              controller: emailController,
              title: "Email",
              hint: "e.g. Bogunride22@gmail.com",
              bottomPadding: 0,
            ),
            const Spacer(),
            MedBottomButton(
              text: "Edit Profile",
              onPressed: () {
                // context.go(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
