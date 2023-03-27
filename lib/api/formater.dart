import 'package:intl/intl.dart';
// models
import 'package:glass_ui/models/student.dart';
import 'package:glass_ui/models/timetable.dart';
import 'package:glass_ui/models/absences.dart';
// my libs
import '../models/grade.dart';
import 'user.dart';

/* FUNCTIONS For UI To Get STRUCTURED Data */

class Formater {

  // Formatting timeTable
  static Future<List<TimeTable>> getTable(User user) async {
    // Get Current Date and Format
    final now = DateTime.now();
    final pattern = DateFormat('yyyy-MM-dd');
    final fromDate = pattern.format(now);
    final toDate = pattern.format(now.add(const Duration(days: 1)));

    //(fromDate, toDate); // ("2023-03-16", "2023-03-17");
    List<dynamic> timeTable = await user.fetchTimetable(fromDate, toDate);
    // sort by lesson number asc
    timeTable.sort(
      (d1, d2) => (d1['Oraszam']).compareTo((d2['Oraszam'])),
    );

    return timeTable.map((e) => TimeTable.fromAPI(e)).toList();
  }

  // Formatting Absences
  static Future<Absences> getAbsences(User user) async {
    return Absences.fromAPI(await user.fetchAbsences());
  }

  // Formatting Student
  static Future<Student> getStudent(User user) async {
    return Student.fromAPI(await user.fetchInfo());
  }

  // Formatting Evaluations
  static Future<List<Grade>> getEvaluations(User user) async {
    List<dynamic> grades = await user.fetchEvaluations();
    // sort timeline asc
    grades.sort(
      (a, b) => DateTime.parse(b['KeszitesDatuma']).compareTo(DateTime.parse(a['KeszitesDatuma'])),
    );

    return grades.map((e) => Grade.fromAPI(e)).toList();
  }
}
