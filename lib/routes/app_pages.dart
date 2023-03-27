// ignore_for_file: prefer_const_constructors, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';
// screens
import 'package:glass_ui/screens/login/login_screen.dart';
import 'package:glass_ui/screens/main_frame/main_frame.dart';
// pages
import 'package:glass_ui/pages/absences/absences_page.dart';
import 'package:glass_ui/pages/home/home_page.dart';
import 'package:glass_ui/pages/grades/grades_page.dart';
import 'package:glass_ui/pages/student/student_page.dart';
import 'package:glass_ui/pages/timetable/timetable_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.NAVIGATOR,
      page: () => MainFrame(),
    ),
  ];

  static Widget getPage(String page) {
    switch (page) {
      case Routes.HOME:
        return HomePage(key: Key("1"));
      case Routes.TIMETABLE:
        return TimetablePage(key: Key("2"));
      case Routes.GRADES:
        return GradesPage(key: Key("3"));
      case Routes.ABSENCES:
        return AbsencesPage(key: Key("4"));
      case Routes.USERINFO:
        return StudentPage(key: Key("5"));
      default:
        return HomePage(key: Key("1"));
    }
  }

  /*
  static final List<Widget> pages = [
    HomePage(key: Key("1")),
    TimetablePage(key: Key("2")),
    GradesPage(key: Key("3")),
    AbsencesPage(key: Key("4")),
    StudentPage(key: Key("5")),
  ];
  */
}
