import '../../../services/models/grade.dart';

class ValueCount {
  final String value;
  final int amount;

  ValueCount(
    this.value,
    this.amount,
  );

  static List<ValueCount> getValueCount(List grades) {
    Map<String, int> amountByValue = {"5": 0, "4": 0, "3": 0, "2": 0, "1": 0};

    for (Grade grade in grades) {
      if (amountByValue.containsKey(grade.value) && grade.precentWeight != "null") {
        amountByValue[grade.value] = (amountByValue[grade.value] ?? 0) + 1;
      }
    }

    List<ValueCount> returnList = [];
    amountByValue.forEach((key, value) => returnList.add(ValueCount(key, value)));

    return returnList;
  }
}
