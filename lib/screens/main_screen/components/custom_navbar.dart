import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/services/controllers/frame_controller.dart';
import '../../../constants/view_const.dart';
import '../helpers/navbar_items.dart';
// rive imports
import 'package:rive/rive.dart';
import '../helpers/rive_utils.dart';


class CustomNavbar extends StatelessWidget {
  CustomNavbar({super.key});

  final frameController = Get.put(FrameController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        right: 22,
        left: 22,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        color: constBgColor.withOpacity(0.98), 
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
            bottomNavs.length,
            (index) => Obx(
              () => GestureDetector(
                onTap: () => frameController.onBottomMenuTap(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Opacity(
                        opacity: bottomNavs[index] == frameController.selectedNav.value ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                          artboard: bottomNavs[index].artboard,
                          onInit: (artboard) {
                            StateMachineController controller = RiveUtils.getRiveController(
                              artboard,
                              stateMachineName: bottomNavs[index].stateMachineName,
                            );
                            bottomNavs[index].input = controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),

                    // Active navItem underline
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 140),
                      height: 4,
                      width: bottomNavs[index] == frameController.selectedNav.value ? 20 : 0,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
