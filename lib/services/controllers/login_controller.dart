// basic
import 'package:flutter/material.dart';
import 'package:mini_naplo/constants/constants.dart' as cv;
// services
import 'package:mini_naplo/services/controllers/network_service.dart';
import 'package:mini_naplo/services/controllers/api_service.dart';
// routing / state
import 'package:get/get.dart';
import 'package:mini_naplo/routes/app_routes.dart';
// hive database
import 'package:hive_flutter/hive_flutter.dart';
// for relogin page set
// import 'frame_controller.dart';


class LoginController extends GetxController {
  // ui variables
  final buttonText = "Bejelentkezés".obs;
  final isObscure = true.obs;
  // db refrence
  final mainBox = Hive.box("MainBox");
  // text controllers
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // on Button Press
  void signUserIn() async {
    if (!Get.find<NetworkService>().hasConnection) {
      buttonText("Nincsen internet!");
      return;
    }

    final String username = usernameController.text;
    final String password = passwordController.text;

    // assert problems && validate imput
    if (!_studentIsValid(username, password)) return;

    final apiService = Get.find<ApiService>();
    final loginSuccess = await apiService.createUser(
      username: username,
      password: password,
      institute: cv.instituteCode,
    );

    if (!loginSuccess) {
      buttonText("Hibás Jelszó, vagy Felhasználónév");
      return;
    }

    buttonText("Sikeres bejelentkezés");
    await apiService.initData();
    await _addStudentToDb(username, password, apiService.bearerAsMap);

    Get.parameters['relogin'] == null ? Get.offNamed(Routes.NAVIGATOR) : Get.back();
  }

  // validating inputs
  bool _studentIsValid(String user, String password) {
    if (user.isEmpty) {
      buttonText("Üres Felhasználónév mező!");
      return false;
    }
    if (password.isEmpty) {
      buttonText("Üres Jelszó mező!");
      return false;
    }
    return true;
  }

  // save valid user to database
  Future<void> _addStudentToDb(String usr, String pwd, Map brr) async {
    await mainBox.put("username", usr);
    await mainBox.put("password", pwd);
    await mainBox.put("bearer", brr);
  }

  void resetButtonText(String text) => buttonText("Bejelentkezés");
}
