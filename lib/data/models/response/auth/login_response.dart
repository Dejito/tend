

class AuthToken {
  final String? accessToken;
  final String? refreshToken;

  AuthToken({
     this.accessToken,
     this.refreshToken,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

}
