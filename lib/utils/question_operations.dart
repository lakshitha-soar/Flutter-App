import 'package:soar_app/models/survey.dart';

List getSortedSurveyPageItems(SurveyPages surveyPages) {
  Map<int, Object> tempMap = {};
  List sortedItemList = [];

  if ((surveyPages?.questions ?? []).length > 0 ||
      (surveyPages?.surveySections ?? []).length > 0) {
        [...surveyPages?.questions ?? [], ...surveyPages?.surveySections ?? []]
            .forEach((item) {
          if (item is Questions) {
            tempMap[item.sequenceNumber] = item;
          }
          if (item is SurveySections) {
            tempMap[item.sequenceNumber] = item;
          }
        });

    var sortedKeys = ((tempMap.keys.toList(growable: false))
      ..sort((k1, k2) => k1.compareTo(k2)));
    sortedKeys.forEach((key) {
      if (tempMap[key] is SurveySections) {
        (tempMap[key] as SurveySections)
            .questions
            .sort((a, b) => a.sequenceNumber.compareTo(b.sequenceNumber));
      }
      sortedItemList.add(tempMap[key]);
    });
  }

  return sortedItemList;
}
