// ignore_for_file: avoid_print
import 'package:glass_ui/client/user.dart';
import 'package:glass_ui/1unUsed/secrets.dart';
//import 'kreta_api.dart';

Future<void> main(List<String> args) async {
  

  final user = User(username, password, institute);
  await user.init();
  final bool succ = await user.login();

  print(succ ? "Logged in" : "Failed to login");

  print(await user.getAbsences());
}
