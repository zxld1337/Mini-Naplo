// ignore_for_file: public_member_api_docs, sort_constructors_first
class TimeTable {
  String name;
  String subjectNum;
  String teacher;
  String roomId;
  String fromTime;
  String tillTime;
  String presence;
  String? description;
  String? topic;
  String? subTeacher;
  String? status;

  TimeTable({
    required this.name,
    required this.subjectNum,
    required this.teacher,
    required this.roomId,
    required this.fromTime,
    required this.tillTime,
    required this.presence,
    required this.description,
    required this.topic,
    required this.subTeacher,
    required this.status,
  });

  factory TimeTable.fromAPI(Map lesson) {    
    return TimeTable(
      name: lesson["Tantargy"]["Nev"],
      subjectNum: lesson["Oraszam"].toString(),
      teacher: lesson["TanarNeve"],
      roomId: lesson["TeremNeve"].toString(),
      fromTime: addHour(formatHour(lesson["KezdetIdopont"])),
      tillTime: addHour(formatHour(lesson["VegIdopont"])),
      presence: lesson["TanuloJelenlet"]["Nev"],
      description: lesson["Tantargy"]?["Kategoria"]["Leiras"] ?? Null,
      topic: lesson["Tema"],
      subTeacher: lesson["HelyettesTanarNeve"],
      status: lesson["Allapot"]["Nev"],
    );
  }

  // Formating time
  static String formatHour(String time) => time.split('T')[1].substring(0, 5);
  static String addHour(String time) => "${int.parse(time.split(':')[0]) + 2}:${time.split(':')[1]}";

  @override
  String toString() {
    return "TimeTable(name: $name, subjectNum: $subjectNum, teacher: $teacher, roomId: $roomId, fromTime: $fromTime, tillTime: $tillTime, presence: $presence, description: $description, topic: $topic, subTeacher: $subTeacher, status: $status)";
  }
}
