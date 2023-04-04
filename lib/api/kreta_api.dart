// encoding
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';
// bearer model
import 'package:glass_ui/models/bearer.dart';
// helpers
import 'endpoints.dart';
import 'fetch_helper.dart';
// interface
import 'kreta_api_interface.dart';

// for comments check 'kreta_api_interface.dart'
abstract class KretaAPI implements IKretaAPI {
  String user;
  String password;
  String institute;
  late Bearer bearer;
  late Map<String, String> headers;
  late Map<String, String> reqHeaders;

  KretaAPI(
    this.user,
    this.password,
    this.institute,
  );

  @override
  Future<void> init() async {
    final nonce = (await http.get(Uri.parse(Kreta.IDP + KretaEndpoints.nonce))).body;

    List<int> key = [98, 97, 83, 115, 120, 79, 119, 108, 85, 49, 106, 77];
    List<int> messageBytes = utf8.encode(institute.toUpperCase() + nonce + user.toUpperCase());
    Hmac hmac = Hmac(sha512, key);

    Digest dig = hmac.convert(messageBytes);
    String generated = base64.encode(dig.bytes);

    headers = FetchHelper.headers(generated, nonce);
  }

  @override
  Future<bool> login() async {
    final response = await http.post(
      Uri.parse(Kreta.IDP + KretaEndpoints.token),
      headers: headers,
      body: FetchHelper.loginBody(user, password, institute),
    );

    final res = jsonDecode(response.body);
    if (!res.containsKey("access_token") && res["access_token"] == null) {
      return false;
    }

    bearer = Bearer.fromMap(res);
    headers["Authorization"] = bearer.accessToken;
    reqHeaders = FetchHelper.reqHeaders(bearer.accessToken);

    return true;
  }

  @override
  Future<void> refreshBearer() async {
    final response = await http.post(
      Uri.parse(Kreta.IDP + KretaEndpoints.token),
      headers: headers,
      body: FetchHelper.refreshBody(institute, bearer.refreshToken),
    );

    final Map res = jsonDecode(response.body);
    bearer = Bearer.fromMap(res);
    headers["Authorization"] = bearer.accessToken;
    reqHeaders = FetchHelper.reqHeaders(bearer.accessToken);
  }

  @override
  Future<List> fetchEvaluations() async {
    final response = await http.get(
      Uri.parse(Kreta.base(institute) + KretaEndpoints.evaluations),
      headers: reqHeaders,
    );
    return jsonDecode(response.body);
  }

  @override
  Future<List> fetchTimetable(String fromDate, String toDate) async {
    if (fromDate == "" || toDate == "") return "missing args" as List;

    final uri = Uri.parse(
      Kreta.base(institute) + KretaEndpoints.timetable,
    ).replace(queryParameters: {
      "datumTol": fromDate,
      "datumIg": toDate,
    });

    final response = await http.get(uri, headers: reqHeaders);
    return jsonDecode(response.body);
  }

  @override
  Future<List> fetchAbsences() async {
    final response = await http.get(
      Uri.parse(Kreta.base(institute) + KretaEndpoints.absences),
      headers: reqHeaders,
    );
    return jsonDecode(response.body);
  }

  @override
  Future<Map<String, dynamic>> fetchStudentInfo() async {
    final response = await http.get(
      Uri.parse(Kreta.base(institute) + KretaEndpoints.student),
      headers: reqHeaders,
    );
    return jsonDecode(response.body);
  }
}
