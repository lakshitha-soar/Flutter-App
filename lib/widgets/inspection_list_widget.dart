import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/models/inspection.dart';
import 'package:soar_app/utils/utils.dart';
import 'package:soar_app/widgets/widgets.dart';

class InspectionListWidget extends StatefulWidget {
  final Inspection inspection;

  InspectionListWidget({Key key, this.inspection}) : super(key: key);

  @override
  _InspectionListWidget createState() => _InspectionListWidget();
}

class _InspectionListWidget extends State<InspectionListWidget> {
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
          _bottomPopupForInspection(context);
        },
        child: Container(
          child: Column(
            children: [
              Container(
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
                          Row(
                            children: [
                              Text(
                                widget.inspection.title.toUpperCase(),
                                style: TextStyle(
                                  fontFamily: ThemeConstants.font,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.4,
                                  color: Palette.gray_1,
                                  height: 1.3,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: (widget.inspection.isCompleted)
                                      ? Palette.success
                                      : Palette.failure,
                                ),
                                child: Text(
                                  (widget.inspection.isCompleted)
                                      ? 'Completed'.inCaps
                                      : 'Incomplete'.inCaps,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            widget.inspection.description.paraInCaps,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  NameValueWidget(
                                      name: "Inspector",
                                      value: widget.inspection.inspector,
                                      width: (isTabSize(context)) ? null : 150),
                                  NameValueWidget(
                                      name: "Date",
                                      value: widget.inspection.startedDate),
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
              (!widget.inspection.isCompleted)
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
                      color: Palette.gray_5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: InspectionProgressBar(
                            progressLevel: widget.inspection.progressLevel),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _bottomPopupForInspection(BuildContext context) {
    return showModalBottomSheet<void>(
      barrierColor: Palette.bottom_popup_bg.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
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
                  height: 50.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                        Navigator.of(context).pushReplacementNamed(
                            PageRoutes.draftedInspectionQuestionScreen,
                            arguments: widget.inspection);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.primaryColor,
                          borderRadius: BorderRadius.circular(
                              ThemeConstants.borderRadius),
                        ),
                        child: Text(
                          "Resume Inspection".toUpperCase(),
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
