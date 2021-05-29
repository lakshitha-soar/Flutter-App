import 'package:soar_app/models/questions_page.dart';

class Template {
  String tId;
  String title;
  String description;
  String author;
  String createdDate;
  List<QuestionsPage> questionsPages;

  Template(
      {this.tId,
      this.title,
      this.description,
      this.author,
      this.createdDate,
      this.questionsPages});
}
