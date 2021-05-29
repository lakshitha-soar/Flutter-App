import 'package:soar_app/constants/type_of_responses_constants.dart';
import 'package:soar_app/models/question_types/question_type.dart';

class QText extends QuestionType {
  QText({questionType = TEXT, defaultValue, responseValue})
      : super(
            questionType: questionType,
            defaultValue: defaultValue,
            responseValue: responseValue);
}
