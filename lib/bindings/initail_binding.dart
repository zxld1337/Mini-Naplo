import 'package:get/get.dart';
// controllers
import 'package:mini_naplo/services/controllers/chart_controller.dart';
// services
import 'package:mini_naplo/services/controllers/api_service.dart';
import 'package:mini_naplo/services/controllers/network_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {    
    Get.put(NetworkService());
    Get.putAsync(() async => ApiService());

    Get.lazyPut(() => ChartController());
  }
}
