import 'package:mini_naplo/screens/main_screen/helpers/navbar_items.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';


class FrameController extends GetxController {
  final selectedNav = bottomNavs.first.obs;
  final selectedNavIndex = 0.obs;

  get currentPageRoute => selectedNav.value.page;
  get currentPage => selectedNavIndex.value;

  void setPageIndex(int index) => selectedNavIndex(index);

  void onBottomMenuTap(int index) async {
    bottomNavs[index].input!.change(true);
    if (bottomNavs[index] != selectedNav.value) {
      selectedNav(bottomNavs[index]);
      selectedNavIndex(index);
    }
    Future.delayed(const Duration(seconds: 1), () {
      bottomNavs[index].input!.change(false);
    });
  }

  void logoutStudent() {
    final mainBox = Hive.box('MainBox');
    mainBox.clear();
    Get.toNamed("${Routes.LOGIN}?relogin=true");
  }
}
