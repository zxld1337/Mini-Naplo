// ignore_for_file: constant_identifier_names

class Kreta {
  static String base(String ist) => "https://$ist.ekreta.hu";
  
  static const IDP = "https://idp.e-kreta.hu";
  static const ADMIN = "https://eugyintezes.e-kreta.hu";
  static const FILES = "https://files.e-kreta.hu";
}

class KretaEndpoints {
  static const token = "/connect/token";
  static const nonce = "/nonce";
  static const notes = "/ellenorzo/V3/Sajat/Feljegyzesek";
  static const events = "/ellenorzo/V3/Sajat/FaliujsagElemek";
  static const student = "/ellenorzo/V3/Sajat/TanuloAdatlap";
  static const evaluations = "/ellenorzo/V3/Sajat/Ertekelesek";
  static const absences = "/ellenorzo/V3/Sajat/Mulasztasok";
  static const groups = "/ellenorzo/V3/Sajat/OsztalyCsoportok";
  static const classAverages = "/V3/Sajat/Ertekelesek/Atlagok/OsztalyAtlagok";
  static const timetable = "/ellenorzo/V3/Sajat/OrarendElemek";
  static const announcedTests = "/ellenorzo/V3/Sajat/BejelentettSzamonkeresek";
  static const homeworks = "/ellenorzo/V3/Sajat/HaziFeladatok";
  static const homeworkDone = "/ellenorzo/V3/Sajat/HaziFeladatok/Megoldva";
  static const capabilities = "/ellenorzo/V3/Sajat/Intezmenyek";

  static const userAgent = "hu.ekreta.student/1.0.5/Android/0/0";
  static const clientID = "kreta-ellenorzo-mobile-android";
}