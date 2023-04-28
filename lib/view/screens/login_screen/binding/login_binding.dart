import 'package:get/get.dart';
import '../../../../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
