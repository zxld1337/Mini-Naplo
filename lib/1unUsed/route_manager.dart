import 'package:flutter/material.dart';
// routes
import 'package:glass_ui/screens/login/login_screen.dart';
import 'package:glass_ui/screens/main_frame/main_frame.dart';
import './error/error_screen.dart';


class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login': 
        return _navigateTo(LoginScreen());      
      case '/home':
        return _navigateTo(MainFrame());
      case '/error':
        return _navigateTo(const ErrorScreen());
    }
    return null;
  }

  // MPR shortener 
  static Route<dynamic> _navigateTo(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
