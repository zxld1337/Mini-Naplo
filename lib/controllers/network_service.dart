import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/api_service.dart';

class NetworkService extends GetxService {
  static NetworkService get to => Get.find();

  final Connectivity _connection = Connectivity();
  final _hasConnection = true.obs;
  bool get hasConnection => _hasConnection.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    _connection.onConnectivityChanged.listen(_updateConnection);
    _updateConnection(await _connection.checkConnectivity());
  }

  Future<void> _updateConnection(ConnectivityResult conResult) async {
    if (conResult == ConnectivityResult.none) {
      _showOfflineSnackBar();
      _hasConnection.value = false;
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        _hasConnection.value = true;
        if (!ApiService.to.dataLoaded) {
          await ApiService.to.onInit();
        }
      }
    }
  }

  void _showOfflineSnackBar() {
    Get.snackbar(
      '',
      '',
      titleText: const Text(
        'INTERNET PROBLÉMA',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      messageText: const Text('NINCSEN INTERNET KAPCSOLAT!'),
      borderRadius: 16,
      isDismissible: false,
      duration: const Duration(days: 1),
      backgroundColor: Colors.red[400]!.withOpacity(0.6),
      shouldIconPulse: true,
      icon: Icon(Icons.wifi_off, color: Colors.black.withOpacity(0.8), size: 35),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.only(left: 26, top: 16, bottom: 16),
    );
  }
}
