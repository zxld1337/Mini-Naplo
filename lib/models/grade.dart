// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:collection';

class Grade {
  String fixedDate;
  String prepDate;
  String evalName;
  String? topic;
  String yearType;
  String? gradeType;
  String valueType;
  String teacher;
  String nature;
  String value;
  String? precentWeight;

  Grade({
    required this.fixedDate,
    required this.prepDate,
    required this.evalName,
    required this.topic,
    required this.yearType,
    required this.gradeType,
    required this.valueType,
    required this.teacher,
    required this.nature,
    required this.value,
    required this.precentWeight,
  });

  factory Grade.fromAPI(Map grade) {
    return Grade(
      fixedDate: grade["RogzitesDatuma"],
      prepDate: grade["KeszitesDatuma"],
      evalName: grade["Tantargy"]["Nev"],
      topic: grade["Tema"],
      yearType: grade["Tipus"]["Nev"],
      gradeType: grade["Mod"]?["Leiras"],
      valueType: grade["ErtekFajta"]["Nev"],
      teacher: grade["ErtekeloTanarNeve"],
      nature: grade["Jelleg"],
      value: grade["SzamErtek"].toString(),
      precentWeight: grade["SulySzazalekErteke"].toString(),
    );
  }

  static Map<dynamic, dynamic> getGradesPerSubject(List<Grade> grades) {
    Map<String, dynamic> gradesPerSubject = {};

    for (var item in grades) {
      //if (item.yearType == "felevi_jegy_ertekeles") continue;

      // Group By Subject Name && Sets default map to Keys
      gradesPerSubject.putIfAbsent(
        item.evalName,
        () => {"calculated": 0.0, "count": 0, "avg": 0, "objs": []},
      );

      // Filling the default map keys
      gradesPerSubject[item.evalName]["objs"].add(item);

      // Fill avg if has value
      if (item.value != "null" && item.precentWeight != "null") {
        final int weight = int.parse(item.precentWeight!);
        gradesPerSubject[item.evalName]["count"] += weight;
        gradesPerSubject[item.evalName]["avg"] += int.parse(item.value) * weight;
      }
    }

    // Calculating subject avg's
    gradesPerSubject.forEach((key, value) {
      gradesPerSubject[key]["calculated"] =
          double.parse((value["avg"] / value["count"]).toStringAsFixed(2));
    });

    return gradesPerSubject;
  }

  static Map sortByCustom(Map<dynamic, dynamic> gps, String sortby) {
    return LinkedHashMap.fromEntries(
      gps.entries.toList()..sort((a, b) => b.value[sortby].compareTo(a.value[sortby])),
    );
  }

  @override
  String toString() {
    return 'Grade(fixedDate: $fixedDate, prepDate: $prepDate, evalName: $evalName, topic: $topic, yearType: $yearType, gradeType: $gradeType, valueType: $valueType, teacher: $teacher, nature: $nature, value: $value, precentWeight: $precentWeight)';
  }
}
