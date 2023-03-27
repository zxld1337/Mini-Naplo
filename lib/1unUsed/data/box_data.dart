import 'package:hive_flutter/hive_flutter.dart';

class Box {
  static const String boxName = "MainBox";
  bool isOpen = false;

  init() async => await Hive.initFlutter();
  open() async => await Hive.openBox(boxName);
  getOpen() => Hive.box(boxName);
  close() async => await getOpen().close();
  clear() async => await getOpen().clear();
  delete() async => await getOpen().deleteFromDisk();

  initDataBase() async {
    init();
    open();
    isOpen = true;    
  }
}
