import 'endpoints.dart';

// holds headers for different types of requests
class FetchHelper {
  // header for login, refreshBearer
  static Map<String, String> headers(generated, nonce) => {
      "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
      "User-Agent": KretaEndpoints.userAgent,
      "X-AuthorizationPolicy-Key": generated,
      "X-AuthorizationPolicy-Nonce": nonce,
      "X-AuthorizationPolicy-Version": "v2",
      "Authorization": ""
    };

  // header for fetching user related data
  static Map<String, String> reqHeaders(String accessToken) => {
      "Authorization": "Bearer $accessToken",
      "User-Agent": KretaEndpoints.userAgent,
    };

  // request body for login
  static Map<String, String> loginBody(user, password, institute) => {
      "userName": user,
      "password": password,
      "institute_code": institute,
      "grant_type": "password",
      "client_id": KretaEndpoints.clientID
    };

  // request body for refreshing bearer
  static Map<String, String> refreshBody(institute, String refreshToken) => {
      "institute_code": institute,
      "refresh_token": refreshToken,
      "grant_type": "refresh_token",
      "client_id": KretaEndpoints.clientID
    };
}
