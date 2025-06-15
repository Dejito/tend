import 'package:blackchinx/data/models/request/auth/login_reqbody.dart';
import 'package:blackchinx/data/models/request/auth/update_user_req_body.dart';
import 'package:blackchinx/data/service/http_util.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/app_url.dart';
import '../../models/request/auth/create_user_req.dart';

class ApiService {

  static Future<Response> createUser(CreateUserRequestBody createUserRequestBody) async {
    var response = await HttpUtil().post(
      AppUrl.createUser,
      data: createUserRequestBody.toJson(),
    );
    return response;
  }


  static Future<Response> login(LoginRequestBody loginRequestBody) async {
    var response = await HttpUtil().post(AppUrl.login,
    data: loginRequestBody.toJson());
    return response;
  }

  static Future<Response> getUser() async {
    var response = await HttpUtil().get(AppUrl.getUser);
    return response;
  }

  static Future<Response> fetchProducts() async {
    var response = await HttpUtil().get(AppUrl.fetchProduct);
    return response;
  }

  static Future<Response> updateUser(UpdateUserRequestBody updateUserRequestBody) async {
    var response = await HttpUtil().put(AppUrl.updateUser,
    data: updateUserRequestBody.toJson());
    return response;
  }




}
