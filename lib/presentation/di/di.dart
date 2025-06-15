import 'package:get_it/get_it.dart';

import '../../data/models/response/auth/login_response.dart';

setupAuthToken(GetIt ioc) {
  ioc.registerSingleton<AuthToken>(AuthToken());
}