class Survey {
  String surveyId;
  String surveyTitle;
  String description;
  String author;
  String createdDate;
  SurveyHeader surveyHeader;

  Survey(
      {this.surveyId,
        this.surveyTitle,
        this.description,
        this.author,
        this.createdDate,
        this.surveyHeader});

  Survey.fromJson(Map<String, dynamic> json) {
    surveyId = json['survey_Id'];
    surveyTitle = json['survey_title'];
    description = json['description'];
    author = json['author'];
    createdDate = json['createdDate'];
    surveyHeader = json['survey_header'] != null
        ? new SurveyHeader.fromJson(json['survey_header'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['survey_Id'] = this.surveyId;
    data['survey_title'] = this.surveyTitle;
    data['description'] = this.description;
    data['author'] = this.author;
    data['createdDate'] = this.createdDate;
    if (this.surveyHeader != null) {
      data['survey_header'] = this.surveyHeader.toJson();
    }
    return data;
  }
}

class SurveyHeader {
  String surveyHeaderId;
  List<SurveyPages> surveyPages;

  SurveyHeader({this.surveyHeaderId, this.surveyPages});

  SurveyHeader.fromJson(Map<String, dynamic> json) {
    surveyHeaderId = json['survey_headerId'];
    if (json['survey_pages'] != null) {
      surveyPages = new List<SurveyPages>();
      json['survey_pages'].forEach((v) {
        surveyPages.add(new SurveyPages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['survey_headerId'] = this.surveyHeaderId;
    if (this.surveyPages != null) {
      data['survey_pages'] = this.surveyPages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurveyPages {
  List<SurveySections> surveySections;
  List<Questions> questions;

  SurveyPages({this.surveySections, this.questions});

  SurveyPages.fromJson(Map<String, dynamic> json) {
    if (json['survey_sections'] != null) {
      surveySections = new List<SurveySections>();
      json['survey_sections'].forEach((v) {
        surveySections.add(new SurveySections.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surveySections != null) {
      data['survey_sections'] =
          this.surveySections.map((v) => v.toJson()).toList();
    }
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurveySections {
  String sectionId;
  String sectionTitle;
  int sequenceNumber;
  List<Questions> questions;

  SurveySections(
      {this.sectionId, this.sectionTitle, this.sequenceNumber, this.questions});

  SurveySections.fromJson(Map<String, dynamic> json) {
    sectionId = json['section_id'];
    sectionTitle = json['section_title'];
    sequenceNumber = json['sequenceNumber'];
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_id'] = this.sectionId;
    data['section_title'] = this.sectionTitle;
    data['sequenceNumber'] = this.sequenceNumber;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String questionId;
  String questionTitle;
  String typeOfResponses;
  String response;
  int sequenceNumber;
  List<QuestionOptions> questionOptions;

  Questions(
      {this.questionId,
        this.questionTitle,
        this.typeOfResponses,
        this.response,
        this.sequenceNumber,
        this.questionOptions});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionTitle = json['question_title'];
    typeOfResponses = json['typeOfResponses'];
    response = json['response'];
    sequenceNumber = json['sequenceNumber'];
    if (json['question_options'] != null) {
      questionOptions = new List<QuestionOptions>();
      json['question_options'].forEach((v) {
        questionOptions.add(new QuestionOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question_title'] = this.questionTitle;
    data['typeOfResponses'] = this.typeOfResponses;
    data['response'] = this.response;
    data['sequenceNumber'] = this.sequenceNumber;
    if (this.questionOptions != null) {
      data['question_options'] =
          this.questionOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionOptions {
  bool required;
  bool multiSelection;
  List<String> optionChoices;

  QuestionOptions({this.required, this.multiSelection, this.optionChoices});

  QuestionOptions.fromJson(Map<String, dynamic> json) {
    required = json['required'];
    multiSelection = json['multi_selection'];
    optionChoices = json['option_choices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required'] = this.required;
    data['multi_selection'] = this.multiSelection;
    data['option_choices'] = this.optionChoices;
    return data;
  }
}
