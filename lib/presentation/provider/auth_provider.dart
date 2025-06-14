import 'package:blackchinx/data/models/request/auth/create_user_req.dart';
import 'package:blackchinx/data/models/response/auth/create_user_response.dart';
import 'package:blackchinx/data/service/api_service/user_api.dart';
import 'package:blackchinx/data/service/http_util.dart';
import 'package:blackchinx/presentation/views/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {

  bool isLoading = false;
  late final CreateUserResponse createUserResponse;

  Future<void> createUser(CreateUserRequestBody createUserRequestBody) async {
    _showLoadingIndicator();
    try {
      final response = await ApiService.createUser(createUserRequestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        createUserResponse = CreateUserResponse.fromJson(response.body);
        hideLoadingIndicator();
      } else {
        showToast(message: "Unexpected server response. Please try again.");
      }
    } catch (e) {
      handleError(error: e);
      hideLoadingIndicator();
    }
  }


  void _showLoadingIndicator() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoadingIndicator() {
    isLoading = false;
    notifyListeners();
  }

}

