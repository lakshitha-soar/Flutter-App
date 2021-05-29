import 'package:soar_app/models/question_types/question_type.dart';

class QCheckBox extends QuestionType {
  QCheckBox({defaultValue, responseValue})
      : super(defaultValue: defaultValue, responseValue: responseValue);
}
