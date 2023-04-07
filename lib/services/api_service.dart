// state manager
import 'package:get/get.dart';
// backend client
import 'package:glass_ui/client/user.dart';
import '../controllers/chart_controller.dart';
// database
import 'package:hive/hive.dart';
// utils
import 'package:glass_ui/models/models.dart';
import 'package:glass_ui/utils/constants.dart' as cv;


class ApiController extends GetxService {
  final timeTable = <TimeTable>[].obs;
  final grades = <Grade>[].obs;
  var gradesPerSubject = <dynamic, dynamic>{}.obs;

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
      cv.instituteCode,
    );

    await user.init();
    await user.login();

    timeTable(await user.getTable());
    grades(await user.getEvaluations());
    absence(await user.getAbsences());
    student(await user.getStudentInfo());

    Get.find<ChartController>().setData(grades);
  }

  void getGps() {
    // Group by sub
    gradesPerSubject(Grade.getGradesPerSubject(grades.value));
    // Remove sub where 0
    gradesPerSubject.removeWhere((key, value) => value["calculated"] == 0);
    gradesPerSubject.removeWhere((key, value) => value["calculated"].isNaN);
    // Sort by DESC
    gradesPerSubject.value = Grade.sortByCustom(gradesPerSubject, "calculated");
  }
}
