// models
import 'package:glass_ui/services/models/grade.dart';
import 'package:glass_ui/services/models/timetable.dart';
import 'package:glass_ui/services/models/absences.dart';
import 'package:glass_ui/services/models/student.dart';

// formats fetched json and returns data models
abstract class IUser {
  
  // formats Evaluations [Ertekelesek]
  Future<List<Grade>> getEvaluations();

  // formats TimeTable [OrarendElemek]
  Future<List<TimeTable>> getTable();

  // formats Absences [Mulasztasok]
  Future<Absences> getAbsences();

  // formats Student Info [TanuloAdatlap]
  Future<Student> getStudentInfo();
}