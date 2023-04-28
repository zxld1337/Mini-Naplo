import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// my libs
import 'package:mini_naplo/constants/view_const.dart';
import 'package:mini_naplo/controllers/login_controller.dart';
//components
import 'components/screen_background.dart';


class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // backgound image
          const ScreenBackground(),

          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.6),
          ),

          // Glass effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),

          // login Screen layout
          SingleChildScrollView(
            //physics:
            child: Column(
              children: [
                // header Img
                SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Image.asset(
                    loginHeader,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(height: 32),
                // main Title
                const Text(
                  "Mini napló",
                  style: TextStyle(
                    fontSize: 52,
                    color: constFontColor,
                    fontFamily: constFontFamily,
                  ),
                ),

                // sub Title
                Text(
                  "Belépés a jövőbe!",
                  style: TextStyle(
                    fontSize: 24,
                    color: constFontColor.withOpacity(0.4),
                    fontFamily: constFontFamily,
                  ),
                ),
                const SizedBox(height: 32),
                // TextFields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      // Username TextField
                      TextField(
                        controller: controller.usernameController,
                        onChanged: controller.resetButtonText,
                        cursorColor: constFontColor,
                        style: const TextStyle(color: constFontColor, fontFamily: constFontFamily),
                        decoration: InputDecoration(
                          hintText: 'Oktatási azonosító',
                          hintStyle:
                              TextStyle(fontSize: 12, color: constFontColor.withOpacity(0.2)),
                          labelText: 'Felhasználónév',
                          labelStyle: TextStyle(color: constFontColor.withOpacity(0.6)),
                          filled: true,
                          fillColor: constFontColor.withOpacity(0.1),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: constFontColor.withOpacity(0.4),
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: constFontColor),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline_rounded,
                            color: constFontColor.withOpacity(0.6),
                          ),
                        ),
                      ),

                      // Password TextField
                      Obx(
                        () => TextField(
                          controller: controller.passwordController,
                          onChanged: controller.resetButtonText,
                          cursorColor: constFontColor,
                          style:
                              const TextStyle(color: constFontColor, fontFamily: constFontFamily),
                          obscureText: controller.isObscure.value,
                          decoration: InputDecoration(
                            hintText: "Születési dátum",
                            hintStyle:
                                TextStyle(fontSize: 12, color: constFontColor.withOpacity(0.2)),
                            labelText: 'Jelszó',
                            labelStyle: TextStyle(color: constFontColor.withOpacity(0.6)),
                            filled: true,
                            fillColor: constFontColor.withOpacity(0.1),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: constFontColor.withOpacity(0.4)),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: constFontColor),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline_rounded,
                              color: constFontColor.withOpacity(0.6),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => controller.isObscure.toggle(),
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              color: controller.isObscure()
                                  ? constFontColor.withOpacity(0.6)
                                  : constFontColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),

                // Login button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.orange,
                            Colors.purple,
                          ],
                        ),
                      ),
                      child: Obx(
                        () => TextButton(
                          onPressed: controller.signUserIn,
                          child: FittedBox(
                            child: Text(
                              controller.buttonText(),
                              style: const TextStyle(
                                color: constFontColor,
                                fontFamily: constFontFamily,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // when keyboard active gives space under the button
                const SizedBox(height: 20),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                MediaQuery.of(context).viewInsets.bottom == 0 ? "zx vision - 2022" : "",
                style: TextStyle(
                  color: constFontColor.withOpacity(0.4),
                  fontFamily: constFontFamily,
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
