import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/models/survey.dart';
import 'package:soar_app/widgets/widgets.dart';
import 'package:soar_app/models/questions_page.dart';
import 'package:soar_app/models/template.dart';
import 'package:soar_app/utils/utils.dart';
import 'package:soar_app/services/services.dart';

class NewInspectionQuestionScreen extends StatefulWidget {
  @override
  _NewInspectionQuestionScreenState createState() =>
      _NewInspectionQuestionScreenState();
}

class _NewInspectionQuestionScreenState
    extends State<NewInspectionQuestionScreen> {
  Survey survey;

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    setData();
  }

  void setData() async {
    var data = await getSurveyJson();

    setState(() {
      survey = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<SurveyPages> surveyPages = this.survey?.surveyHeader?.surveyPages;

    return WillPopScope(
      // onWillPop: () {
      //   print("back");
      //   // return Future.value(false);
      // },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: (survey != null) ? _appBar() : SizedBox.shrink(),
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: (survey != null)
                ? [
                    ...surveyPages
                        .asMap()
                        .entries
                        .map((entry) => _surveyPage(entry.value, entry.key,
                            isLastPage:
                                (surveyPages.length == (entry.key + 1))))
                        .toList(),
                  ]
                : [Container()],
          ),
        ),
        bottomNavigationBar:
            (survey != null) ? _bottomNavigationBar() : SizedBox.shrink(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 80.0,
      elevation: 15,
      shadowColor: Palette.gray_4,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.0,
            child: Text(
              "Save Draft".inCaps,
              style: TextStyle(
                color: Palette.gray_3,
                fontSize: 15.0,
                letterSpacing: 2.0,
                height: 1.2,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                this.survey.surveyTitle.toUpperCase(),
                style: TextStyle(
                  color: Palette.gray_1,
                  fontFamily: ThemeConstants.font,
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 60.0,
            child: Container(
              child: Icon(
                SoarIcon.last_page,
                size: 30.0,
                color: Palette.gray_3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Palette.gray_4,
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: _pageNavigation(),
            ),
          ],
        ));
  }

  Widget _pageNavigation() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: Theme.of(context).backgroundColor,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: (currentPage != 0),
              child: InkWell(
                onTap: () {
                  if (currentPage != 0) {
                    pageController.animateToPage(--currentPage,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear);
                  }
                },
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 35.0,
                        color: Palette.gray_1,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Back".inCaps,
                          style: TextStyle(
                            color: Palette.gray_1,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Page ".inCaps +
                              '${currentPage}/${this.survey?.surveyHeader?.surveyPages?.length})',
                          style: TextStyle(
                            color: Palette.gray_1,
                            fontSize: 13.0,
                            letterSpacing: 2.0,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: ((this.survey?.surveyHeader?.surveyPages?.length != 1) &&
                  ((currentPage + 1) !=
                      this.survey?.surveyHeader?.surveyPages?.length)),
              child: InkWell(
                onTap: () {
                  if ((this.survey?.surveyHeader?.surveyPages?.length != 1) &&
                      ((currentPage + 1) !=
                          this.survey?.surveyHeader?.surveyPages?.length)) {
                    pageController.animateToPage(++currentPage,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Next".inCaps,
                          style: TextStyle(
                            color: Palette.gray_1,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Page ".inCaps +
                              '${currentPage + 2}/${this.survey?.surveyHeader?.surveyPages?.length})',
                          style: TextStyle(
                            color: Palette.gray_1,
                            fontSize: 13.0,
                            letterSpacing: 2.0,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 35.0,
                        color: Palette.gray_1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _surveyPage(SurveyPages surveyPage, int pageNumber,
      {bool isLastPage}) {
    var pageItemList = getSortedSurveyPageItems(surveyPage);

    return ListView.builder(
      itemCount: pageItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return (pageItemList[index] is Questions)
            ? Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  children: [
                    QuestionWidget(
                        questions: (pageItemList[index] as Questions),
                        imageFiles: [],
                        note: ""),
                    (isLastPage && (pageItemList.length == (index + 1)))
                        ? Container(
                            margin: EdgeInsets.only(
                              top: 50.0,
                              bottom: 100.0,
                            ),
                            child: Column(
                              children: [
                                _previewAndExport(),
                                SizedBox(
                                  height: 30.0,
                                ),
                                _completeInspection(),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ))
            : Column(
                children: [
                  Container(
                    margin: (index == 0) ? EdgeInsets.only(top: 20.0) : null,
                    child: SectionExpansionTile(
                      title:
                          (pageItemList[index] as SurveySections).sectionTitle,
                      trailingText: "",
                      questions:
                          ((pageItemList[index] as SurveySections).questions) ??
                              [],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.5, color: Palette.gray_7),
                    )),
                  ),
                  (isLastPage && (pageItemList.length == (index + 1)))
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 50.0,
                            bottom: 100.0,
                          ),
                          child: Column(
                            children: [
                              _previewAndExport(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _completeInspection(),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              );
      },
    );
  }

  Widget _previewAndExport() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.primaryColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
      ),
      child: Text(
        "Preview & Export".toUpperCase(),
        style: TextStyle(
          color: Palette.gray_1,
          fontFamily: ThemeConstants.font,
          fontWeight: FontWeight.w700,
          fontSize: 15.0,
          letterSpacing: 3.0,
        ),
      ),
    );
  }

  Widget _completeInspection() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
      ),
      child: Text(
        "Complete Inspection".toUpperCase(),
        style: TextStyle(
          color: Palette.bottom_popup_text_color,
          fontFamily: ThemeConstants.font,
          fontWeight: FontWeight.w700,
          fontSize: 15.0,
          letterSpacing: 3.0,
        ),
      ),
    );
  }
}
