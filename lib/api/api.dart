import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
// my libs
import 'endpoints.dart';
import '../models/bearer.dart';

class Api {
  String user;
  String password;
  String institute;
  late Bearer bearer;
  late Map<String, String> headers;
  late Map<String, String> reqHeaders;

  Api(this.user, this.password, this.institute);

  Future<void> getHeaders() async {
    final nonce = (await http.get(Uri.parse(Kreta.IDP + KretaEndpoints.nonce))).body;

    List<int> key = [98, 97, 83, 115, 120, 79, 119, 108, 85, 49, 106, 77];
    List<int> messageBytes = utf8.encode(institute.toUpperCase() + nonce + user.toUpperCase());
    Hmac hmac = Hmac(sha512, key);

    Digest dig = hmac.convert(messageBytes);
    String generated = base64.encode(dig.bytes);

    headers = {
      "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
      "User-Agent": KretaEndpoints.userAgent,
      "X-AuthorizationPolicy-Key": generated,
      "X-AuthorizationPolicy-Nonce": nonce,
      "X-AuthorizationPolicy-Version": "v2",
      "Authorization": ""
    };
  }

  Future<bool> login() async {
    Map<String, String> body = {
      "userName": user,
      "password": password,
      "institute_code": institute,
      "grant_type": "password",
      "client_id": KretaEndpoints.clientID
    };

    final responseJson = await http.post(
      Uri.parse(Kreta.IDP + KretaEndpoints.token),
      headers: headers,
      body: body,
    );

    final Map res = jsonDecode(responseJson.body);
    if (!res.containsKey("access_token") && res["access_token"] == null) {
      return false;
    }

    bearer = Bearer.fromMap(res);
    headers["Authorization"] = bearer.accessToken;
    reqHeaders = {
      "Authorization": "Bearer ${bearer.accessToken}",
      "User-Agent": KretaEndpoints.userAgent,
    };

    return true;
  }

  Future<void> refreshBearer() async {
    Map<String, String> body = {
      "institute_code": institute,
      "refresh_token": bearer.refreshToken,
      "grant_type": "refresh_token",
      "client_id": KretaEndpoints.clientID
    };

    final responseJson = await http.post(
      Uri.parse(Kreta.IDP + KretaEndpoints.token),
      headers: headers,
      body: body,
    );

    final Map res = jsonDecode(responseJson.body);
    bearer = Bearer.fromMap(res);
    headers["Authorization"] = bearer.accessToken;
    reqHeaders = {
      "Authorization": "Bearer ${bearer.accessToken}",
      "User-Agent": KretaEndpoints.userAgent,
    };
  }
}
