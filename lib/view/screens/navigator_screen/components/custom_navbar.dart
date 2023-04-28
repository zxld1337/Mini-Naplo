import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/navigator_controller.dart';
import '../../../../constants/view_const.dart';
import '../helpers/navbar_items.dart';
// rive imports
import 'package:rive/rive.dart';
import '../helpers/rive_utils.dart';


class CustomNavbar extends GetView<NavigatorController> {
  const CustomNavbar({super.key});

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
            navbarItems.length,
            (index) => Obx(
              () => GestureDetector(
                onTap: () => controller.onBottomMenuTap(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(                      
                      height: 40,
                      width: 40,
                      child: Opacity(
                        opacity: navbarItems[index] == controller.selectedNav() ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          navbarItems.first.src,
                          artboard: navbarItems[index].artboard,
                          onInit: (artboard) {
                            StateMachineController riveController = RiveUtils.getRiveController(
                              artboard,
                              stateMachineName: navbarItems[index].stateMachineName,
                            );
                            navbarItems[index].input = riveController.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),

                    // Active navItem underline
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 140),
                      height: 4,
                      width: navbarItems[index] == controller.selectedNav() ? 20 : 0,
                      decoration: const BoxDecoration(
                        color: constSecondaryColor,
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