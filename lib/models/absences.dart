class Absences {
  String? allAbsences;
  String? verifiedAbsences;
  String? unVerifiedAbsences;
  Map<String, dynamic>? perSubject;

  Absences({
    this.allAbsences,
    this.verifiedAbsences,
    this.unVerifiedAbsences,
    this.perSubject,
  });

  static Map<String, String> nameConv = {
    "Szoftverfejlesztés gyakorlat": "szofjlgy",
    "Szoftverfejlesztés": "szoffejl",
    "Webfejlesztés": "webfejl",
    "Webfejlesztés gyakorlat": "webfjlgy",
    "Foglalkoztatás I.": "fogl1",
    "Foglalkoztatás II.": "fogl2",
    "Szakmai idegen nyelv": "szidnye",
    "Hittan": "hit",
    "Osztályfőnöki": "Osztályfőnöki"
  };

  factory Absences.fromAPI(List<dynamic> abs) {
    Map<String, dynamic> absencesPerSubject = {};

    for (var item in abs) {
      var subject = item["Tantargy"]["Nev"];
      absencesPerSubject.putIfAbsent(subject, () => 0);
      absencesPerSubject[subject] += 1;
    }

    return Absences(
      allAbsences: abs.length.toString(),
      verifiedAbsences: abs.where((x) => x["IgazolasAllapota"] == "Igazolt").length.toString(),
      unVerifiedAbsences: abs.where((x) => x["IgazolasAllapota"] == "Igazolando").length.toString(),
      perSubject: absencesPerSubject,
    );
  }
}
