import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_naplo/constants/constants.dart' as cv;
// services
import 'package:mini_naplo/controllers/network_service.dart';
import 'package:mini_naplo/controllers/api_service.dart';
// routing / state
import 'package:get/get.dart';
import 'package:mini_naplo/routes/app_routes.dart';


class LoginController extends GetxController {
  // ui variables
  final buttonText = "Bejelentkezés".obs;
  final isObscure = true.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUserIn() async {
    if (!NetworkService.to.hasConnection) {
      buttonText("Nincsen internet!");
      return;
    }

    final String username = usernameController.text;
    final String password = passwordController.text;

    // assert problems && validate imput
    if (!_studentIsValid(username, password)) return;

    final apiService = ApiService.to;
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
    final db = Hive.box("mainBox");
    await db.put("username", usr);
    await db.put("password", pwd);
    await db.put("bearer", brr);
  }

  void resetButtonText(String text) => buttonText("Bejelentkezés");
}
