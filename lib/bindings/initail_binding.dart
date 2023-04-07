import 'package:get/get.dart';
// controllers
import 'package:glass_ui/services/api_service.dart';
import 'package:glass_ui/controllers/chart_controller.dart';
import 'package:glass_ui/controllers/frame_controller.dart';
import 'package:glass_ui/controllers/login_controller.dart';
import 'package:glass_ui/services/network_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NetworkService>(NetworkService());
    
    Get.create<LoginController>(() => LoginController());
    Get.lazyPut<ApiService>(() => ApiService());

    Get.put<ChartController>(ChartController());
    Get.lazyPut<FrameController>(() => FrameController());
  }
}