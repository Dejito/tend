import 'package:blackchinx/data/models/request/auth/create_user_req.dart';
import 'package:blackchinx/data/models/request/auth/login_reqbody.dart';
import 'package:blackchinx/data/models/request/auth/update_user_req_body.dart';
import 'package:blackchinx/data/models/response/auth/create_user_response.dart';
import 'package:blackchinx/data/models/response/auth/login_response.dart';
import 'package:blackchinx/data/service/api_service/user_api.dart';
import 'package:blackchinx/data/service/http_util.dart';
import 'package:blackchinx/presentation/views/widgets/flutter_toast.dart';
import 'package:blackchinx/presentation/views/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';

import '../../app_launch.dart';
import '../views/product/screens/product_overview_screen.dart';

class AuthProvider with ChangeNotifier {

  bool isLoading = false;
  // bool isUserCreated = false;


  late final CreateUserResponse createUserResponse;
  late final AuthToken authToken;


  Future<void> createUser(CreateUserRequestBody createUserRequestBody) async {
    showEaseLoadingIndicator();
    try {
      final response = await ApiService.createUser(createUserRequestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        createUserResponse = CreateUserResponse.fromJson(response.body);
        dismissLoadingIndicator();
        // isUserCreated = true;
        showToast(message: "Congratulation!! \nUser created successfully!");
        notifyListeners();
      } else {
        showToast(message: "Unexpected server response. Please try again.");
      }
    } catch (e) {
      handleError(error: e);
      dismissLoadingIndicator();
    }
  }


  Future<void> login(LoginRequestBody loginRequestBody, BuildContext context) async {
    showEaseLoadingIndicator();
    try {
      final response = await ApiService.login(loginRequestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        authToken = AuthToken.fromJson(response.body);
        getIt.registerSingleton<AuthToken>(authToken).accessToken;
        dismissLoadingIndicator();
        // isLoginSuccessful = true;
        notifyListeners();
        if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(ProductsOverviewScreen.id);
        }
      } else {
        showToast(message: "Unexpected server response. Please try again.");
      }
    } catch (e) {
      dismissLoadingIndicator();
      handleError(error: e);
    }
  }

  Future<void> updateUser(UpdateUserRequestBody updateUserRequestBody, BuildContext context) async {
    showEaseLoadingIndicator();
    try {
      final response = await ApiService.updateUser(updateUserRequestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        dismissLoadingIndicator();
        notifyListeners();
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(ProductsOverviewScreen.id);
        }
      } else {
        showToast(message: "Unexpected server response. Please try again.");
      }
    } catch (e) {
      dismissLoadingIndicator();
      handleError(error: e);
    }

  }


  // void setLoginSuccessfulFlagToFalse() {
  //   isLoginSuccessful = false;
  //   notifyListeners();
  // }


  // void _showLoadingIndicator() {
  //   isLoading = true;
  //
  //   notifyListeners();
  // }
  //
  // void hideLoadingIndicator() {
  //   isLoading = false;
  //   notifyListeners();
  // }

}

