import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/models/template.dart';
import 'package:soar_app/utils/utils.dart';
import 'package:soar_app/widgets/name_value_widget.dart';

class TemplateListWidget extends StatefulWidget {
  final Template template;

  TemplateListWidget({Key key, this.template}) : super(key: key);

  @override
  _TemplateListWidgetState createState() => _TemplateListWidgetState();
}

class _TemplateListWidgetState extends State<TemplateListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        border: Border.all(
          color: Palette.gray_5,
          width: 1.5,
        ),
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        highlightColor: Palette.highlight,
        overlayColor: MaterialStateProperty.all(Palette.highlight),
        onTap: () {
          _bottomPopupForTemplate(context);
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ThemeConstants.borderRadius),
                  border: Border.all(
                    color: Palette.primaryColor,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  SoarIcon.soar,
                  color: Palette.primaryColor,
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.template.title.toUpperCase(),
                      style: TextStyle(
                        fontFamily: ThemeConstants.font,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                        color: Palette.gray_1,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      widget.template.description.paraInCaps,
                      style: TextStyle(
                        fontFamily: ThemeConstants.font,
                        fontWeight: FontWeight.normal,
                        fontSize: 13.0,
                        letterSpacing: 1.5,
                        color: Palette.gray_3,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NameValueWidget(
                                name: "Author",
                                value: widget.template.author,
                                width: (isTabSize(context)) ? null : 150),
                            NameValueWidget(
                                name: "Date",
                                value: widget.template.createdDate),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _bottomPopupForTemplate(BuildContext context) {
    return showModalBottomSheet<void>(
      barrierColor: Palette.bottom_popup_bg.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Palette.bottom_popup_bg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Palette.gray_5,
                spreadRadius: 15,
                blurRadius: 15,
                offset: Offset(5, 0), // changes position of shadow
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Palette.gray_5,
                      ),
                      child: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                Container(
                  height: 170.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          print("Archive");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.archive),
                            ),
                            Text(
                              "Archive".inCaps,
                              style: TextStyle(
                                color: Palette.gray_1,
                                fontFamily: ThemeConstants.font,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("Edit Template");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.edit),
                            ),
                            Text(
                              "Edit Template".inCaps,
                              style: TextStyle(
                                color: Palette.gray_1,
                                fontFamily: ThemeConstants.font,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("Details");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.info_outline),
                            ),
                            Text(
                              "Details".inCaps,
                              style: TextStyle(
                                color: Palette.gray_1,
                                fontFamily: ThemeConstants.font,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(PageRoutes.newInspectionQuestionScreen, arguments: widget.template);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.primaryColor,
                          borderRadius:
                          BorderRadius.circular(ThemeConstants.borderRadius),
                        ),
                        child: Text(
                          "Start Inspection".toUpperCase(),
                          style: TextStyle(
                            color: Palette.bottom_popup_text_color,
                            fontFamily: ThemeConstants.font,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            letterSpacing: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

