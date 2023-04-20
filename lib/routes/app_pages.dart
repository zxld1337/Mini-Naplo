import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
// bindings
import 'package:mini_naplo/screens/main_screen/binding/main_binding.dart';
import 'package:mini_naplo/screens/login_screen/binding/login_binding.dart';
// screens
import 'package:mini_naplo/screens/login_screen/login_screen.dart';
import 'package:mini_naplo/screens/main_screen/main_screen.dart';
// pages
import 'package:mini_naplo/pages/absences/absences_page.dart';
import 'package:mini_naplo/pages/home/home_page.dart';
import 'package:mini_naplo/pages/grades/grades_page.dart';
import 'package:mini_naplo/pages/student/student_page.dart';
import 'package:mini_naplo/pages/timetable/timetable_page.dart';


class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.NAVIGATOR,
      page: () => const MainFrame(),
      transition: Transition.cupertino,
      binding: FrameBinding(),  
    ),
  ];

  static Widget getPage(String page) {
    switch (page) {
      case Routes.HOME: return const HomePage(key: Key("1"));
      case Routes.TIMETABLE: return const TimetablePage(key: Key("2"));
      case Routes.GRADES: return const GradesPage(key: Key("3"));
      case Routes.ABSENCES: return const AbsencesPage(key: Key("4"));
      case Routes.USERINFO: return const StudentPage(key: Key("5"));
      default: return const HomePage(key: Key("1"));
    }
  }
}
