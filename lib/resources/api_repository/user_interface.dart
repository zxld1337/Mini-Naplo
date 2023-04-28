// models
import 'package:mini_naplo/models/grade.dart';
import 'package:mini_naplo/models/timetable.dart';
import 'package:mini_naplo/models/absences.dart';
import 'package:mini_naplo/models/student.dart';

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