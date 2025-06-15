import 'package:blackchinx/data/models/request/auth/update_user_req_body.dart';
import 'package:blackchinx/presentation/views/widgets/titleText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../auth_widgets.dart';
import '../widgets/elevated_bottom_button.dart';
import '../widgets/text_input.dart';

class ProfilePage extends StatelessWidget {
  static const route = '/profile-page';

  ProfilePage({super.key});

  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _nameController.text = authProvider.user.name ?? "";
    _emailController.text = authProvider.user.email ?? "";
    return Scaffold(
      appBar: AppBar(
        title: titleText("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              profileAvatar(authProvider.user.avatar),
              const SizedBox(
                height: 30,
              ),
              InputText(
                title: "Name",
                hint: 'e.g. Blessing',
                controller: _nameController,
                bottomPadding: 30,
              ),
              InputText(
                controller: _emailController,
                title: "Email",
                hint: "e.g. Bogunride22@gmail.com",
                bottomPadding: 0,
              ),
              const Divider(height: 50,),
              MedBottomButton(
                text: "Edit Profile",
                onPressed: () {
                  final updateUserRequestBody = UpdateUserRequestBody(
                      email: _emailController.text, name: _nameController.text);
                  authProvider.updateUser(updateUserRequestBody, context);
                  // context.go(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
