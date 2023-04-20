// state manager
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// backend client
import 'package:mini_naplo/services/client/user.dart';
import 'chart_controller.dart';
// database
import 'package:hive/hive.dart';
// utils
import 'package:mini_naplo/services/controllers/network_service.dart';
import 'package:mini_naplo/services/models/models.dart';
import 'package:mini_naplo/constants/constants.dart' as cv;

class ApiService extends GetxService {
  static ApiService get to => Get.find();

  // reactive UI data variables
  final timeTable = <TimeTable>[].obs;
  final grades = <Grade>[].obs;
  final gradesPerSubject = <dynamic, dynamic>{}.obs;
  final absence = Absences().obs;
  final student = Student().obs;
  // private
  final _dataLoaded = false.obs;
  final _user = User().obs;
  final db = Hive.box('mainBox');

  // getters
  get dataLoaded => _dataLoaded.value;
  get bearerAsMap => _user.value.bearer.toMap();

  @override
  Future<void> onInit() async {
    super.onInit();

    // early returns for offline and null database
    if (!Get.find<NetworkService>().hasConnection) return;
    if (db.get('username') == null) return;

    // show dialog till data loading
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );

    await createUser(
      username: db.get('username'),
      password: db.get('password'),
      institute: cv.instituteCode,
    );
    await initData();
    _dataLoaded(true);

    Navigator.of(Get.overlayContext!).pop();
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
      institute: institute,
    ));
    await _user().init();

    return await _user().login();
  }

  Future<void> refreshData() async {
    if (!NetworkService.to.hasConnection) return;

    await _user().refreshBearer();
    await initData();
  }

  Future<void> initData() async {
    student(await _user().getStudentInfo());
    absence(await _user().getAbsences());
    grades(await _user().getEvaluations());

    Get.find<ChartController>().setData(grades);
    getGps();

    try {
      timeTable(await _user().getTable());
    } catch (e) {
      // errors if not school day
    }
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
