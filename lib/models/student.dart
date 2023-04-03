// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  // basic info [school, user]
  String? instName;
  String? instId;
  String? studentName;
  // born infos
  String? birthPlace;
  String? birthDate;
  String? birthYear;
  String? birthMonth;
  String? birthDay;
  // related to user
  String? motherName;
  List? address;
  List? parents;

  Student({
    this.instName,
    this.instId,
    this.studentName,
    this.birthPlace,
    this.birthDate,
    this.birthYear,
    this.birthMonth,
    this.birthDay,
    this.motherName,
    this.address,
    this.parents,
  });

  factory Student.fromAPI(Map<String, dynamic> student) {
    return Student(
      // basic info [school, user]
      instName: student["IntezmenyNev"],
      instId: student["IntezmenyAzonosito"],
      studentName: student["Nev"],
      // born infos
      birthPlace: student["SzuletesiHely"],
      birthDate: student["SzuletesiDatum"],
      birthYear: student["SzuletesiEv"].toString(),
      birthMonth: student["SzuletesiHonap"].toString(),
      birthDay: formatDay(student["SzuletesiNap"].toString()),
      // related to user
      motherName: student["AnyjaNeve"],
      address: student["Cimek"],
      parents: student["Gondviselok"],
    );
  }

  static String formatDay(day) => day.length == 1 ? "0$day" : day;

  @override
  String toString() {
    return 'Student(instName: $instName, instId: $instId, studentName: $studentName, birthPlace: $birthPlace, birthDate: $birthDate, birthYear: $birthYear, birthMonth: $birthMonth, birthDay: $birthDay, motherName: $motherName, address: $address, parents: $parents)';
  }
}
