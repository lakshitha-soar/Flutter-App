import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/models/inspection.dart';
import 'package:soar_app/models/template.dart';
import 'package:soar_app/utils/utils.dart';

class DraftedInspectionQuestionScreen extends StatefulWidget {
  final Inspection inspection;

  DraftedInspectionQuestionScreen({Key key, this.inspection}) : super(key: key);

  @override
  _DraftedInspectionQuestionScreenState createState() =>
      _DraftedInspectionQuestionScreenState();
}

class _DraftedInspectionQuestionScreenState
    extends State<DraftedInspectionQuestionScreen> {
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: () {
      //   print("back");
      //   return Future.value(false);
      // },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: _appBar(),
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
              print(currentPage);
            },
            children: [
              ...widget.inspection.template.questionsPages
                  .asMap()
                  .entries
                  .map((entry) => Center(
                    child: Container(
                          child: Text('${entry.key}'),
                        ),
                  ))
                  .toList(),
            ],
          ),
        ),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: (isTabSize(context)) ? 80.0 : null,
      elevation: 0,
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
              "Save".inCaps,
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
                widget.inspection.template.title.toUpperCase(),
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

  Widget _progressBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 3.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: LinearProgressIndicator(
          value: (widget.inspection.progressLevel) ?? 0,
          backgroundColor: Palette.gray_5,
          valueColor: AlwaysStoppedAnimation<Color>(Palette.primaryColor),
        ),
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
              color: Palette.gray_5,
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          children: [
            _progressBar(),
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
                              '${currentPage}/${widget.inspection.template.questionsPages.length})',
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
              visible:
                  ((widget.inspection.template.questionsPages.length != 1) &&
                      ((currentPage + 1) !=
                          widget.inspection.template.questionsPages.length)),
              child: InkWell(
                onTap: () {
                  if ((widget.inspection.template.questionsPages.length != 1) &&
                      ((currentPage + 1) !=
                          widget.inspection.template.questionsPages.length)) {
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
                              '${currentPage + 2}/${widget.inspection.template.questionsPages.length})',
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
}
