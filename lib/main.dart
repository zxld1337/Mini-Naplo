import 'package:flutter/material.dart';
// state / route mangager / controllers
import 'package:get/get.dart';
import 'bindings/initail_binding.dart';
// routes
import 'package:glass_ui/routes/app_pages.dart';
import 'package:glass_ui/routes/app_routes.dart';
// database
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init widgets
  WidgetsFlutterBinding.ensureInitialized();
  // init database
  await Hive.initFlutter();
  await Hive.openBox("MainBox");
  // Start App
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("MainBox");
    final String? user = box.get('username');
    
    return GetMaterialApp(
      title: 'Mini Napló',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: user == null ? Routes.LOGIN : Routes.NAVIGATOR,
      getPages: AppPages.routes,
    );
  }
}
