import 'package:soar_app/models/question_types/question_type.dart';

class QSlider extends QuestionType {
  double min;
  double max;

  QSlider({this.min, this.max, defaultValue, responseValue})
      : super(defaultValue: defaultValue, responseValue: responseValue);
}
