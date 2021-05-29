import 'package:soar_app/models/template.dart';

class Inspection {
  String iId;
  String title;
  String description;
  String inspector;
  String startedDate;
  bool isCompleted;
  double progressLevel;
  Template template;

  Inspection(
      {this.iId,
      this.title,
      this.description,
      this.inspector,
      this.startedDate,
      this.isCompleted,
      this.progressLevel,
      this.template});
}
