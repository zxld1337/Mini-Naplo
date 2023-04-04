// ignore_for_file: avoid_print
import 'package:glass_ui/api/notImplemented/client/user.dart';
//import 'kreta_api.dart';

Future<void> main(List<String> args) async {
  const username = '72384037525';
  const password = '2002-10-01';
  const institute = 'vbjnet';

  final user = User(username, password, institute);
  await user.init();
  final bool succ = await user.login();

  print(succ ? "Logged in" : "Failed to login");

  print(await user.getAbsences());
}
