import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:soar_app/models/survey.dart';

Future<Survey> getSurveyJson() async {
  return Survey.fromJson(
      jsonDecode(await rootBundle.loadString('assets/mock/survey.json')));
}
