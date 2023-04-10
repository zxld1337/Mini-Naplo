import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkService extends GetxService {
  final Connectivity _connection = Connectivity();
  final _hasConnection = true.obs;

  get hasConnection => _hasConnection.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    _connection.onConnectivityChanged.listen(_updateConnection);
    _updateConnection(await _connection.checkConnectivity());
  }

  void _updateConnection(ConnectivityResult conResult) {
    if (conResult == ConnectivityResult.none) {
      _hasConnection.value = false;
      _showOfflineSnackBar();
    } else {
      if (Get.isSnackbarOpen) {
        _hasConnection.value = true;
        Get.closeCurrentSnackbar();
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

  // returns true if online
  Future<bool> isOnline() async => await _connection.checkConnectivity() != ConnectivityResult.none;
}
