import 'package:soar_app/models/question.dart';
import 'package:soar_app/models/question_types/q_text.dart';
import 'package:soar_app/models/questions_page.dart';
import 'package:soar_app/models/section.dart';
import 'package:soar_app/models/template.dart';

class TemplatesData {
  static final List<Template> templates = [
    new Template(
        title: "Intermodal Container Inspection Checklist",
        description: "Intermodal container inspection checklist",
        author: "Viranga kekulawala Extended name",
        createdDate: "20/04/2021",
        questionsPages: [
          new QuestionsPage(questionPageItems: [
            new Question(
              orderNumber: 1.0,
              qTitle: "Container Number",
              response: new QText(),
            ),
            new Section(orderNumber: 2.0, sTitle: "Undercarriage"),
            new Section(orderNumber: 3.0, sTitle: "Doors"),
            new Section(
                orderNumber: 4.0, sTitle: "Right Side (Interior & Exterior)"),
            new Section(orderNumber: 5.0, sTitle: "Front Wall)"),
          ]),
          new QuestionsPage(questionPageItems: [
            new Question(
              orderNumber: 1.0,
            ),
            new Question(
              orderNumber: 2.0,
            ),
            new Section(orderNumber: 3.0, sTitle: "Undercarriage"),
            new Section(orderNumber: 4.0, sTitle: "Doors", questions: [
              new Question(
                orderNumber: 4.1,
              ),
              new Question(
                orderNumber: 4.2,
              ),
            ]),
            new Section(
                orderNumber: 5.0, sTitle: "Right Side (Interior & Exterior)"),
            new Section(orderNumber: 6.0, sTitle: "Front Wall)"),
          ]),
          new QuestionsPage(questionPageItems: [
            new Question(
              orderNumber: 1.0,
            ),
            new Question(
              orderNumber: 2.0,
            ),
            new Section(
              orderNumber: 3.0,
            ),
          ])
        ]),
  ];
}
