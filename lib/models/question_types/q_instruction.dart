import 'package:soar_app/models/question_types/question_type.dart';

class QInstruction extends QuestionType {
  QInstruction({defaultValue, responseValue})
      : super(defaultValue: defaultValue, responseValue: responseValue);
}
