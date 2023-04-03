
// interface
abstract class IKretaAPI {
  // gets nonce, key for headers
  Future<void> init();
  // gets the bearer if success
  Future<bool> login();
  // gets fresh bearer
  Future<void> refreshBearer();


  /* fetch methods for getting ui data */

  // Fetch Evaluations [Ertekelesek]
  Future<List<dynamic>> fetchEvaluations();

  // Fetch TimeTable [OrarendElemek]
  Future<List<dynamic>> fetchTimetable(String fromDate, String toDate);

  // Fetch Absences [Mulasztasok]
  Future<List<dynamic>> fetchAbsences();

  // Fetch Student Info [TanuloAdatlap]
  Future<Map<String, dynamic>> fetchStudentInfo();
}