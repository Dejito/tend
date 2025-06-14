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


  // static Future<Response> login(LoginRequestEntity loginRequestEntity) async {
  //   var response = await HttpUtil().post(AppUrl.login,
  //   data: loginRequestEntity.toJson());
  //   return response;
  // }



}
