import 'package:intl/intl.dart';
import '../api/kreta_api.dart';
import 'user_interface.dart';
// models
import 'package:glass_ui/services/models/grade.dart';
import 'package:glass_ui/services/models/timetable.dart';
import 'package:glass_ui/services/models/absences.dart';
import 'package:glass_ui/services/models/student.dart';

// for comments check 'user_interface.dart'
class User extends KretaAPI implements IUser {
  User({super.user, super.password, super.institute});

  @override
  Future<List<Grade>> getEvaluations() async {
    final grades = await fetchEvaluations();
    // sort timeline asc
    grades.sort(
      (a, b) => DateTime.parse(b['KeszitesDatuma']).compareTo(DateTime.parse(a['KeszitesDatuma'])),
    );

    return grades.map((e) => Grade.fromAPI(e)).toList();
  }

  @override
  Future<List<TimeTable>> getTable() async {
    // Get Current Date and Format
    final now = DateTime.now();
    final pattern = DateFormat('yyyy-MM-dd');
    final fromDate = pattern.format(now);
    final toDate = pattern.format(now.add(const Duration(days: 1)));

    final timeTable = await fetchTimetable(fromDate, toDate);
    // sort by lesson number asc
    timeTable.sort(
      (d1, d2) => (d1['Oraszam']).compareTo((d2['Oraszam'])),
    );

    return timeTable.map((e) => TimeTable.fromAPI(e)).toList();
  }

  @override
  Future<Absences> getAbsences() async {
    return Absences.fromAPI(await fetchAbsences());
  }

  @override
  Future<Student> getStudentInfo() async {
    return Student.fromAPI(await fetchStudentInfo());
  }
}
