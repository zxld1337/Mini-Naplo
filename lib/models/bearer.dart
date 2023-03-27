
class Bearer {
  String accessToken;
  String tokenType;
  String expiresIn;
  String refreshToken;

  Bearer({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
  });

  factory Bearer.fromMap(Map<dynamic, dynamic> map) {
    return Bearer(
      accessToken: map['access_token'] as String,
      tokenType: map['token_type'] as String,
      expiresIn: map['expires_in'].toString(),
      refreshToken: map['refresh_token'] as String,
    );
  }

  @override
  String toString() {
    return 'Bearer(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'token_type': tokenType,
      'expires_in': expiresIn,
      'refresh_token': refreshToken,
    };
  }
}
