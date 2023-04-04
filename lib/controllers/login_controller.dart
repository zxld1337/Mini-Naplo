// basic
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:glass_ui/utils/constants.dart';
// services
import 'package:glass_ui/client/user.dart';
// routing
import 'package:glass_ui/routes/app_routes.dart';
// hive database
import 'package:hive_flutter/hive_flutter.dart';

class LoginController extends GetxController {
  // ui vars
  final buttonText = "Bejelentkezés".obs;
  final isObscure = true.obs;
  // text controllers
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  // db refrence
  final mainBox = Hive.box('MainBox');

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
  void signUserIn(context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    // assert problems && validate imput
    if (!studentIsValid(username, password)) return;

    final user = User(username, password, ist);
    await user.init();
    final loginSuccess = await user.login();

    if (!loginSuccess) {
      buttonText.value = "Hibás Jelszó, vagy Felhasználónév";
      return;
    }

    buttonText.value = "Sikeres bejelentkezés";
    await addStudentToDb(username, password, user.bearer.toMap());

    // TODO has problems
    Get.parameters['relogin'] == null ? Get.offNamed(Routes.NAVIGATOR) : Get.back();
  }

  // validating inputs
  bool studentIsValid(String user, String password) {
    if (user.isEmpty) {
      buttonText.value = "Üres Felhasználónév mező!";
      return false;
    }

    if (password.isEmpty) {
      buttonText.value = "Üres Jelszó mező!";
      return false;
    }

    return true;
  }

  // save valid user to database
  Future<void> addStudentToDb(String usr, String pwd, Map brr) async {
    await mainBox.put("username", usr);
    await mainBox.put("password", pwd);
    await mainBox.put("bearer", brr);
  }
}
