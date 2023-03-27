import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// my libs
import 'api.dart';
import 'endpoints.dart';

class User {
  String user;
  String password;
  String institute;
  late Api api;

  User(
    this.user,
    this.password,
    this.institute,
  ) : api = Api(user, password, institute);

  // Fetch TimeTable [OrarendElemek]
  Future<List<dynamic>> fetchTimetable(String fromDate, String toDate) async {
    if (fromDate == "" || toDate == "") return "missing args" as List;

    final uri = Uri.parse(Kreta.base(institute) + KretaEndpoints.timetable)
        .replace(queryParameters: {"datumTol": fromDate, "datumIg": toDate});

    final response = await http.get(uri, headers: api.reqHeaders);
    return jsonDecode(response.body);
  }

  // Fetch Absences [Mulasztasok]
  Future<List<dynamic>> fetchAbsences() async {
    final response = await http.get(
      Uri.parse(Kreta.base(institute) + KretaEndpoints.absences),
      headers: api.reqHeaders,
    );
    return jsonDecode(response.body);
  }

  // Fetch Student Info [TanuloAdatlap]
  Future<Map<String, dynamic>> fetchInfo() async {
    final response = await http.get(
      Uri.parse(Kreta.base(institute) + KretaEndpoints.student),
      headers: api.reqHeaders,
    );
    return jsonDecode(response.body);
  }

  // Fetch Evaluations [Ertekelesek]
  Future<List<dynamic>> fetchEvaluations() async {
    final response = await http.get(
      Uri.parse(Kreta.base(institute) + KretaEndpoints.evaluations),
      headers: api.reqHeaders,
    );
    return jsonDecode(response.body);
  }
}
