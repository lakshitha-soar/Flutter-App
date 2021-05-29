import 'package:soar_app/models/inspection.dart';
import 'package:soar_app/models/question.dart';
import 'package:soar_app/models/questions_page.dart';
import 'package:soar_app/models/section.dart';
import 'package:soar_app/models/template.dart';

class InspectionsData {
  static final List<Inspection> inspections = [
    new Inspection(
        title: "XYZA - 231323",
        description:
            "Intermodal container inspection checklist Intermodal container inspection checklistIntermodal container inspection checklist",
        inspector: "Viranga kekulawala Extended name",
        startedDate: "20/04/2021",
        isCompleted: false,
        progressLevel: 0.7,
        template: Template(
            title: "Intermodal Container Inspection Checklist",
            description: "Intermodal container inspection checklist",
            author: "Viranga kekulawala Extended name",
            createdDate: "20/04/2021",
            questionsPages: [
              new QuestionsPage(questionPageItems: [
                new Section(orderNumber: 1.0, sTitle: "Undercarriage"),
                new Section(orderNumber: 2.0, sTitle: "Doors"),
                new Section(
                    orderNumber: 3.0, sTitle: "Right Side (Interior & Exterior)"),
                new Section(orderNumber: 4.0, sTitle: "Front Wall)"),
                new Question(
                  orderNumber: 5.0,
                ),
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
                new Question(),
                new Question(),
                new Section(),
              ])
            ])),
    new Inspection(
        title: "XYZA - 231323",
        description:
            "Intermodal container inspection checklist Intermodal container inspection checklistIntermodal container inspection checklist",
        inspector: "Viranga kekulawala Extended name",
        startedDate: "20/04/2021",
        isCompleted: false,
        progressLevel: 0.5,
        template: Template(
            title: "Intermodal Container Inspection Checklist",
            description: "Intermodal container inspection checklist",
            author: "Viranga kekulawala Extended name",
            createdDate: "20/04/2021",
            questionsPages: [
              new QuestionsPage(questionPageItems: [
                new Section(orderNumber: 1.0, sTitle: "Undercarriage"),
                new Section(orderNumber: 2.0, sTitle: "Doors"),
                new Section(
                    orderNumber: 3.0, sTitle: "Right Side (Interior & Exterior)"),
                new Section(orderNumber: 4.0, sTitle: "Front Wall)"),
                new Question(
                  orderNumber: 5.0,
                ),
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
                new Question(),
                new Question(),
                new Section(),
              ])
            ])),
  ];
}
