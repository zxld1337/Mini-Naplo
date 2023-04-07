// state manager
import 'package:get/get.dart';
// backend client
import 'package:glass_ui/client/user.dart';
import 'package:glass_ui/services/network_service.dart';
import '../controllers/chart_controller.dart';
// database
import 'package:hive/hive.dart';
// utils
import 'package:glass_ui/models/models.dart';
import 'package:glass_ui/utils/constants.dart' as cv;

class ApiService extends GetxService {
  final timeTable = <TimeTable>[].obs;
  final grades = <Grade>[].obs;
  final gradesPerSubject = <dynamic, dynamic>{}.obs;

  final absence = Absences().obs;
  final student = Student().obs;
  final _user = User().obs;

  final db = Hive.box('MainBox');

  get user => _user.value;
  get bearerAsMap => _user.value.bearer.toMap();

  @override
  Future<void> onInit() async {
    super.onInit();

    if (!await Get.find<NetworkService>().isOnline()) return;
    if (db.get('username') == null) return;

    await createUser(
      username: db.get('username'),
      password: db.get('password'),
      institute: cv.instituteCode,
    );
    
    await initData();
  }

  // returns true if user created successfully
  Future<bool> createUser({
    required String username,
    required String password,
    required String institute,
  }) async {
    _user(User(
      user: username,
      password: password,
      institute: cv.instituteCode,
    ));
    await user.init();
    return (await user.login()) ? true : false;
  }

  Future<void> initData() async {
    timeTable(await user.getTable());
    grades(await user.getEvaluations());
    absence(await user.getAbsences());
    student(await user.getStudentInfo());

    Get.find<ChartController>().setData(grades);
    getGps();
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
