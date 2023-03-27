import 'package:glass_ui/screens/main_frame/helpers/navbar_items.dart';
import 'package:get/get.dart';

class FrameController extends GetxController {
  final selectedNav = bottomNavs.first.obs;
  final selectedNavIndex = 0.obs;

  get currentpageRoute => selectedNav.value.page;
  get currentPage => selectedNavIndex.value;

  void onBottomMenuTap(int index) async {
    bottomNavs[index].input!.change(true);
    if (bottomNavs[index] != selectedNav.value) {
      selectedNav.value = bottomNavs[index];
      selectedNavIndex.value = index;
    }
    Future.delayed(const Duration(seconds: 1), () {
      bottomNavs[index].input!.change(false);
    });
  }
}
