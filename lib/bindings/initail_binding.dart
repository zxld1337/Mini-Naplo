import 'package:get/get.dart';
// controllers
import 'package:glass_ui/controllers/api_controller.dart';
import 'package:glass_ui/controllers/chart_controller.dart';
import 'package:glass_ui/controllers/frame_controller.dart';
import 'package:glass_ui/controllers/login_controller.dart';
import 'package:glass_ui/controllers/network_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.create(() => LoginController());
    
    Get.lazyPut(() => ApiController());
    Get.put<NetworkService>(NetworkService(), permanent: true);

    Get.lazyPut(() => ChartController());
    Get.lazyPut(() => FrameController());
  }
}