// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:glass_ui/api/formater.dart';
// data Models
import 'package:glass_ui/models/grade.dart';
// my lib
import 'package:glass_ui/api/user.dart';

/* FOR TESTING */
/* !NOT USED IN RUNTIME! */

// Print with indentation
void formatPrint(var str) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  print(encoder.convert(str));
}

Future<void> main() async {
  // Login Test Params
  const usr = '72384037525';
  const pwd = '2002-10-01';
  const ist = 'vbjnet';

  /*
  final Api api = Api(usr, pwd, ist);
  await api.getHeaders();
  final bool successful = await api.login();
  await api.refreshBearer();
  */
  final User user = User(usr, pwd, ist);
  await user.api.getHeaders();
  final bool succ = await user.api.login();

  print(succ ? "Logged in" : "Failed to login");
  final List<Grade> grades = await Formater.getEvaluations(user);
  Map<dynamic, dynamic> formated = Grade.getGradesPerSubject(grades);
  formated = Grade.sortByCustom(formated, "calculated");
  // Remove sub where 0
  formated.removeWhere((key, value) => value["calculated"] == 0);
  formated.removeWhere((key, value) => value["calculated"].isNaN);

  formated.forEach((key, value) => print("$key: ${value['calculated']}"));

  //print(grades[23]);
  //print(formated);
  // Get Token Init User
  //Map<String, String?> bearer = await encode.getToken(usr, pwd, ist);
  //Map<String, String> headers = await getTokenTest(usr, pwd, ist);

  //print(bearer);
  //formatPrint(bearer);

  //User user = User(usr, pwd, ist, bearer.cast<String, String>());
  //formatPrint(user.bearer);
  //print(user.refreshBearer());
  //print(user.bearer["access_token"]);

  // GET TIMETABLE
  //List<TimeTable> timetableObj = await Formater.getTable(user);
  //List<dynamic> response = await user.fetchTimetable();
  //List<dynamic> timetable = formatTimeTable(response);
  //print(timetable);
  //formatPrint(response[1]);
  //formatPrint(timetable[0]);
  //print(timetableObj);

  // GET ABSENCES
  //Absences abs = await getAbsences(user);
  //print(abs.perSubject);

  // GET USERINFO
  //Student stud = await getStudent(user);
  //print(stud.parents);

  // GET EVALUATIONS
  //List<dynamic> evals = await user.fetchEvaluations();
  //formatPrint(evals.last);
  //List<Grade> grades = await Formater.getEvaluations(user);
  //print(grades);

  //final vCount = ValueCount.getValueCount(grades);
  //print(vCount);
  // GET GRADES FOR
  //print(grades.last);
  /*
  Map<String, dynamic> gps = Grade.getGradesPerSubject(grades);
  
  final sortedGps = LinkedHashMap.fromEntries(
    gps.entries.toList()
      ..sort((a, b) => b.value['calculated'].compareTo(a.value['calculated'])),
  );

  sortedGps.forEach((key, value) {
    print("$key: ${value['calculated']}");
  });
  //print(gps.keys.elementAt(0));
  //print(gps[gps.keys.elementAt(0)]["avg"] / gps[gps.keys.elementAt(0)]["count"]);
  */
}
