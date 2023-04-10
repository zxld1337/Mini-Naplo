import 'package:mini_naplo/constants/view_const.dart';
import 'package:mini_naplo/routes/app_routes.dart';
import 'rive_asset.dart';

List<RiveAsset> bottomNavs = [
  RiveAsset(
    navbarIcons,
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "home",
    page: Routes.HOME,
  ),
  RiveAsset(
    navbarIcons,
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "lessions",
    page: Routes.TIMETABLE,
  ),
  RiveAsset(
    navbarIcons,
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "grades",
    page: Routes.GRADES,
  ),
  RiveAsset(
    navbarIcons,
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "absences",
    page: Routes.ABSENCES,
  ),
  RiveAsset(
    navbarIcons,
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "userinfo",
    page: Routes.USERINFO,
  ),
];