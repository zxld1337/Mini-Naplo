import 'package:mini_naplo/view/screens/navigator_screen/helpers/navbar_items.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NavigatorController extends GetxController {
  static NavigatorController get to => Get.find();

  final selectedNav = navbarItems.first.obs;
  final selectedNavIndex = 0.obs;

  get currentPageRoute => selectedNav.value.page;
  get currentPage => selectedNavIndex.value;

  void setPageIndex(int index) => selectedNavIndex(index);

  void onBottomMenuTap(int index) async {
    navbarItems[index].input!.change(true);
    if (navbarItems[index] != selectedNav.value) {
      selectedNav(navbarItems[index]);
      selectedNavIndex(index);
    }
    Future.delayed(const Duration(seconds: 1), () {
      navbarItems[index].input!.change(false);
    });
  }

  void logoutStudent() {
    final mainBox = Hive.box('MainBox');
    mainBox.clear();
    Get.toNamed("${Routes.LOGIN}?relogin=true");
  }
}
