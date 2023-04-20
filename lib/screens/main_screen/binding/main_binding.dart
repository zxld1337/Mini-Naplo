import 'package:get/get.dart';
import '../../../services/controllers/frame_controller.dart';

class FrameBinding extends Bindings {
  @override
  dependencies() {
    Get.lazyPut(() => FrameController());
  }
}