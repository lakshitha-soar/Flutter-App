import 'package:soar_app/models/question.dart';
import 'package:soar_app/models/question_page_item.dart';

class Section extends QuestionPageItem {
  String sTitle;
  List<Question> questions;

  Section({
    orderNumber,
    this.sTitle,
    this.questions,
  }) : super(orderNumber: orderNumber);
}
