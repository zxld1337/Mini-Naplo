import 'package:flutter/material.dart';
// Get related / db
import 'package:get/get.dart';
import 'bindings/initail_binding.dart';
import 'package:hive_flutter/hive_flutter.dart';
// routes
import 'package:mini_naplo/routes/app_pages.dart';
import 'package:mini_naplo/routes/app_routes.dart';

void main() async {
  // flutter init
  WidgetsFlutterBinding.ensureInitialized();
  // db init
  await Hive.initFlutter();
  await Hive.openBox("mainBox");
  // Start App
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Hive.box("mainBox");
    final String? user = db.get("username");

    return GetMaterialApp(
      title: "Mini Napló",
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: user == null ? Routes.LOGIN : Routes.NAVIGATOR,
      getPages: AppPages.routes,
    );
  }
}
