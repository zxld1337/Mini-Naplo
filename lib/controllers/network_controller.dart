import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connection = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connection.onConnectivityChanged.listen(_updateConnection);
  }

  void _updateConnection(ConnectivityResult conResult) {
    if (conResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          'NINCSEN INTERNET KAPCSOLAT!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        borderRadius: 16.0,
        backgroundColor: Colors.red[400]!,
        shouldIconPulse: true,
        icon: const Icon(Icons.wifi_off, color: Colors.white, size: 35),
        margin: const EdgeInsets.symmetric(vertical: 74, horizontal: 20),
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
