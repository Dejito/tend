


import 'package:blackchinx/data/models/response/auth/login_response.dart';
import 'package:get_it/get_it.dart';

// void setUpEndpointCalls() {

  // getIt.registerSingleton<AuthCubit>(
  //   AuthCubit(
  //     apiService: ApiService(),
  //   ),
  // );
  //
// }

setupAuthToken(GetIt ioc) {
  ioc.registerSingleton<AuthToken>(AuthToken());
}