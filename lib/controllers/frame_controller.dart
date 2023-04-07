import 'package:glass_ui/screens/main_screen/helpers/navbar_items.dart';
import 'package:get/get.dart';

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
}
