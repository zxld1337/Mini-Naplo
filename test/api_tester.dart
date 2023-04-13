// ignore_for_file: avoid_print
import 'package:mini_naplo/services/client/user.dart';
//import 'kreta_api.dart';

Future<void> main(List<String> args) async {
  final user = User(
    //user: username,
    //password: password,
    //institute: institute,
  );
  await user.init();
  final bool succ = await user.login();

  print(succ ? "Logged in" : "Failed to login");

  print(await user.getAbsences());
}
