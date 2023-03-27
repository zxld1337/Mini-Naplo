/* Model helpers !NOT USED IN RUNTIME! */

List<dynamic> formatTimeTable(List<dynamic> timeTable) {
  // sort list ASC
  timeTable.sort((d1, d2) => (d1['Oraszam'] ?? 0).compareTo((d2['Oraszam'] ?? 0)));

  // Formating time
  String formatHour(String time) => time.split('T')[1].substring(0, 5);
  String addHour(String time) => "${int.parse(time.split(':')[0]) + 1}:${time.split(':')[1]}";

  return timeTable.map(
        (lesson) => {
          "Oraszam": lesson["Oraszam"],
          "Tanarnev": lesson["TanarNeve"],
          "Tantargy": lesson["Tantargy"]?["Nev"] ?? "",
          "Teremszam": lesson["TeremNeve"],
          "KezdetIdopont": addHour(formatHour(lesson["KezdetIdopont"])),
          "VegIdopont": addHour(formatHour(lesson["VegIdopont"])),
          "Leiras": lesson["Tantargy"]?["Kategoria"]["Leiras"] ?? "",
          "Tema": lesson["Tema"],
          "Helyettesitő": lesson["HelyettesTanarNeve"],
          "Allapot": lesson["Allapot"]["Leiras"],
        },
      ).toList();
}

Map<String, dynamic> formatUserInfo(Map<String, dynamic> user) {
  Map<String, dynamic> tempInfo = {
    // basic info [school, user]
    "IntezmenyNev": user["IntezmenyNev"],
    "IntezmenyAzonosito": user["IntezmenyAzonosito"],
    "Nev": user["Nev"],
    // born infos
    "SzuletesiHely": user["SzuletesiHely"],
    "SzuletesiDatum": user["SzuletesiDatum"],
    "SzuletesiEv": user["SzuletesiEv"],
    "SzuletesiHonap": user["SzuletesiHonap"],
    "SzuletesiNap": user["SzuletesiNap"],
    // related to user
    "AnyjaNeve": user["AnyjaNeve"],
    "Cimek": user["Cimek"],
    "Gondviselok": user["Gondviselok"],
  };

  return tempInfo;
}

Map<String, dynamic> formatAbsences(List<dynamic> absences) {
  // Use a map to store the count of absences per subject
  Map<String, dynamic> absencesPerSubject = {};

  for (var item in absences) {
    var subject = item["Tantargy"]["Nev"];
    absencesPerSubject.putIfAbsent(subject, () => 0);
    absencesPerSubject[subject] += 1;
  }

  // Calculate the total and types of absences
  var tempAbsences = {
    "ÖsszesHianyzas": absences.length,
    "IgazoltHianyzas": absences.where((x) => x["IgazolasAllapota"] == "Igazolt").length,
    "IgazolatlanHianyzas": absences.where((x) => x["IgazolasAllapota"] == "Igazolando").length,
    "Targyak": absencesPerSubject,
  };

  return tempAbsences;
}
