import 'package:soar_app/models/add_action.dart';
import 'package:soar_app/models/add_media.dart';
import 'package:soar_app/models/add_note.dart';
import 'package:soar_app/models/question_page_item.dart';
import 'package:soar_app/models/question_types/question_type.dart';

class Question extends QuestionPageItem {
  String qTitle;
  AddNote addNote;
  AddMedia addMedia;
  AddAction addAction;
  bool isRequired;
  QuestionType response;

  Question({
    orderNumber,
    this.qTitle,
    this.addNote,
    this.addMedia,
    this.addAction,
    this.isRequired,
    this.response,
  }) : super(orderNumber: orderNumber);
}
