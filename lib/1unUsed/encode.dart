import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../api/endpoints.dart';

Future<Map<String, String?>> getToken(String usr, String pwd, String ist) async {
  final nonce = (await http.get(Uri.parse(Kreta.IDP + KretaEndpoints.nonce))).body;

  List<int> key = [98, 97, 83, 115, 120, 79, 119, 108, 85, 49, 106, 77];
  List<int> messageBytes = utf8.encode(ist.toUpperCase() + nonce + usr.toUpperCase());
  Hmac hmac = Hmac(sha512, key);

  Digest dig = hmac.convert(messageBytes);
  String generated = base64.encode(dig.bytes);

  Map<String, String> myheaders = {
    "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
    "User-Agent": "hu.ekreta.student/1.0.5/Android/0/0",
    "X-AuthorizationPolicy-Key": generated,
    "X-AuthorizationPolicy-Nonce": nonce,
    "X-AuthorizationPolicy-Version": "v2"
  };


  Map<String, String> data = {
    "userName": usr,
    "password": pwd,
    "institute_code": ist,
    "grant_type": "password",
    "client_id": KretaEndpoints.clientID
  };

  final responseJson = await http.post(
    Uri.parse(Kreta.IDP + KretaEndpoints.token),
    headers: myheaders,
    body: data,
  );

  final res = jsonDecode(responseJson.body);

  try {
    return {
      "access_token": res["access_token"],
      "token_type": res["token_type"],
      "expires_in": res["expires_in"].toString(),
      "refresh_token": res["refresh_token"],
    };
  } catch (exception) {
    return {
      "error": res["error"],
    };
  }
}


