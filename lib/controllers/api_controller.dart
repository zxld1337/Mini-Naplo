import 'package:get/get.dart';
import 'package:glass_ui/client/user.dart';
import 'package:glass_ui/models/absences.dart';
import 'package:glass_ui/models/grade.dart';
import 'package:glass_ui/models/student.dart';
import 'package:glass_ui/models/timetable.dart';
import 'package:hive/hive.dart';
import 'package:glass_ui/utils/constants.dart' as cv;
import 'chart_controller.dart';

class ApiController extends GetxService {
  final timeTable = <TimeTable>[].obs;
  final grades = <Grade>[].obs;
  var gps = <dynamic, dynamic>{}.obs;

  final absence = Absences().obs;
  final student = Student().obs;
  final user = User.new.obs;

  final db = Hive.box('MainBox');

  @override
  Future<void> onInit() async {
    super.onInit();
    await getData();
    getGps();
  }

  Future<void> getData() async {
    final user = User(
      db.get('username'),
      db.get('password'),
      cv.ist,
    );

    await user.init();
    final loginSuccess = await user.login();
    

    timeTable(await user.getTable());
    grades(await user.getEvaluations());
    absence(await user.getAbsences());
    student(await user.getStudentInfo());

    Get.find<ChartController>().setData(grades);
  }

  void getGps() {
    // Group by sub
    gps.value = Grade.getGradesPerSubject(grades.value);
    // Remove sub where 0
    gps.removeWhere((key, value) => value["calculated"] == 0);
    gps.removeWhere((key, value) => value["calculated"].isNaN);
    // Sort by DESC
    gps.value = Grade.sortByCustom(gps, "calculated");
  }
}
