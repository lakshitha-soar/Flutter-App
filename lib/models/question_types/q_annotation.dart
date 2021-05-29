import 'package:soar_app/models/question_types/question_type.dart';

class QAnnotation extends QuestionType {
  QAnnotation({defaultValue, responseValue})
      : super(defaultValue: defaultValue, responseValue: responseValue);
}
