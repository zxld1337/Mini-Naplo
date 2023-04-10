import 'package:get/get.dart';
// controllers
import 'package:mini_naplo/services/controllers/api_service.dart';
import 'package:mini_naplo/services/controllers/chart_controller.dart';
import 'package:mini_naplo/services/controllers/frame_controller.dart';
import 'package:mini_naplo/services/controllers/login_controller.dart';
import 'package:mini_naplo/services/controllers/network_service.dart';

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