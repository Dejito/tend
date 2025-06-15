import 'package:blackchinx/data/models/request/auth/update_user_req_body.dart';
import 'package:blackchinx/presentation/views/widgets/titleText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/service/device_info.dart';
import '../../provider/auth_provider.dart';
import '../auth_widgets.dart';
import '../widgets/elevated_bottom_button.dart';
import '../widgets/text_input.dart';

class ProfilePage extends StatefulWidget {
  static const route = '/profile-page';

  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  void initState() {
    loadDeviceInfo();
    super.initState();
  }
  Future<void> loadDeviceInfo() async {
    final info = await DeviceInfoService.getDeviceInfo();
    setState(() {
      deviceInfo = info;
    });
  }
  Map<String, String>? deviceInfo;

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
        title: const Text("Profile"),
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
              const Divider(height: 50,color: Colors.transparent,),
              MedBottomButton(
                text: "Edit Profile",
                onPressed: () {
                  final updateUserRequestBody = UpdateUserRequestBody(
                      email: _emailController.text, name: _nameController.text);
                  authProvider.updateUser(updateUserRequestBody, context);
                  // context.go(AppRoutes.login);
                },
              ),
              const Divider(height: 80,color: Colors.transparent,),
              if(deviceInfo != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText("Device Name: ${deviceInfo!['name']}"),
                    titleText("Model: ${deviceInfo!['model']}"),
                    titleText("System: ${deviceInfo!['systemName']}"),
                    titleText("Version: ${deviceInfo!['systemVersion']}"),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}