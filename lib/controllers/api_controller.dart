import 'package:get/get.dart';
import 'package:glass_ui/api/formater.dart';
import 'package:glass_ui/api/user.dart';
import 'package:glass_ui/models/absences.dart';
import 'package:glass_ui/models/grade.dart';
import 'package:glass_ui/models/student.dart';
import 'package:glass_ui/models/timetable.dart';
import 'package:hive/hive.dart';
import '../../utils/const_varibles.dart' as cv;
import 'chart_controller.dart';

class ApiController extends GetxService {
  final timeTable = <TimeTable>[].obs;
  final grades = <Grade>[].obs;
  var gps = <dynamic, dynamic>{}.obs;

  final absence = Absences().obs;
  final student = Student().obs;
  final apiClient = User.new.obs;

  final db = Hive.box('MainBox');

  @override
  void onInit() async {
    super.onInit();
    await getData();
    getGps();
  }

  Future getData() async {
    User user = User(
      db.get('username'),
      db.get('password'),
      cv.ist,
    );

    await user.api.getHeaders();
    await user.api.login();

    timeTable.value = await Formater.getTable(user);
    grades.value = await Formater.getEvaluations(user);

    absence(await Formater.getAbsences(user));
    student(await Formater.getStudent(user));

    Get.find<ChartController>().setData(grades);
  }

  void getGps() {
    // Group by sub
    gps.value = Grade.getGradesPerSubject(grades.value);
    // Sort by DESC
    gps.value = Grade.sortByCustom(gps, "calculated");
    // Remove sub where 0
    gps.removeWhere((key, value) => value["calculated"] == 0);
    gps.removeWhere((key, value) => value["calculated"].isNaN);
  }
}
