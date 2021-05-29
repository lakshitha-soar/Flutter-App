import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/constants/type_of_responses_constants.dart';
import 'package:soar_app/models/survey.dart';
import 'package:soar_app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soar_app/widgets/barcode_input_widget.dart';
import 'package:soar_app/widgets/widgets.dart';
import 'package:soar_app/screens/screens.dart';

class QuestionWidget extends StatefulWidget {
  QuestionWidget({Key key, this.questions, this.imageFiles, this.note})
      : super(key: key);

  Questions questions;
  List<File> imageFiles;
  String note;

  List<String> responseValue;

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool addNoteVisible = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
            border: Border.all(
              color: Palette.gray_5,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.questions.questionTitle.inCaps,
                style: TextStyle(
                  color: Palette.gray_1,
                  fontFamily: ThemeConstants.font,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  letterSpacing: 0.8,
                ),
              ),
              _getQuestionWidgetForType(widget.questions.typeOfResponses),
              _imagesContainer(),
              (addNoteVisible)
                  ? Container(
                      margin: EdgeInsets.only(
                        top: 20.0,
                        bottom: 5.0,
                      ),
                      child: TextAreaWidget(),
                    )
                  : SizedBox.shrink(),
              (addNoteVisible)
                  ? Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100.0,
                              margin: EdgeInsets.only(
                                top: 10.0,
                                right: 10.0,
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: Palette.primaryColor,
                                borderRadius: BorderRadius.circular(
                                    ThemeConstants.borderRadius),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Save".inCaps,
                                    style: TextStyle(
                                      color: Palette.bottom_popup_text_color,
                                      fontFamily: ThemeConstants.font,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                      letterSpacing: 3.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                addNoteVisible = false;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              margin: EdgeInsets.only(
                                top: 10.0,
                                right: 10.0,
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: Palette.gray_5,
                                borderRadius: BorderRadius.circular(
                                    ThemeConstants.borderRadius),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Cancel".inCaps,
                                    style: TextStyle(
                                      color: Palette.gray_3,
                                      fontFamily: ThemeConstants.font,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.0,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 30.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              addNoteVisible = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 2.0,
                            ),
                            child: Text(
                              "Add note...".inCaps,
                              style: TextStyle(
                                color: Palette.gray_3,
                                fontFamily: ThemeConstants.font,
                                fontWeight: FontWeight.w600,
                                fontSize: (isSmallThanDesignedSize(context))
                                    ? 12.0
                                    : 16.0,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                _popUpAddMediaDialog(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5.0),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 2.0,
                                ),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.perm_media,
                                        color: Palette.gray_3,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "Media".inCaps,
                                        style: TextStyle(
                                          color: Palette.gray_3,
                                          fontFamily: ThemeConstants.font,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              (isSmallThanDesignedSize(context))
                                                  ? 12.0
                                                  : 16.0,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("action");
                                print('${widget.imageFiles.length}');
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5.0),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 2.0,
                                ),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add_to_photos,
                                        color: Palette.gray_3,
                                        size: 20.0,
                                      ),
                                      SizedBox(
                                        width: 4.0,
                                      ),
                                      Text(
                                        "Action".inCaps,
                                        style: TextStyle(
                                          color: Palette.gray_3,
                                          fontFamily: ThemeConstants.font,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              (isSmallThanDesignedSize(context))
                                                  ? 12.0
                                                  : 16.0,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _popUpAddMediaDialog(BuildContext context) {
    showDialog(
        barrierColor: Palette.bottom_popup_bg.withOpacity(0.7),
        context: context,
        builder: (_) => AlertDialog(
              content: Stack(
                children: [
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Palette.gray_5,
                      ),
                      child: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            _galleryImage(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Icon(Icons.image),
                              ),
                              Text(
                                "Gallery".inCaps,
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
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            _cameraImage(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Icon(Icons.camera_alt),
                              ),
                              Text(
                                "Camera".inCaps,
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
                ],
              ),
              elevation: 10.0,
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ));
  }

  _galleryImage(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      widget.imageFiles.add(File(picture.path));
    });
  }

  _cameraImage(BuildContext context) async {
    var picture = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      widget.imageFiles.add(File(picture.path));
    });
  }

  void _updateImageFilesState(List<File> _imageFiles) {
    setState(() {
      widget.imageFiles = _imageFiles;
    });
  }

  Widget _addMedia() {
    return InkWell(
      onTap: () {
        _popUpAddMediaDialog(context);
      },
      child: Container(
        width: 400.0,
        margin: EdgeInsets.only(top: 20.0),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.perm_media,
                color: Palette.bottom_popup_text_color,
              ),
            ),
            Text(
              "Add Media".inCaps,
              style: TextStyle(
                color: Palette.bottom_popup_text_color,
                fontFamily: ThemeConstants.font,
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagesContainer() {
    return (widget.imageFiles.length > 0)
        ? Container(
            width: 400.0,
            margin: EdgeInsets.only(
              top: (widget.imageFiles.length > 0) ? 20.0 : 10.0,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                ...widget.imageFiles
                    .asMap()
                    .entries
                    .map((entry) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PageRoutes.fullImageListViewScreen,
                                arguments: FullScreenViewArguments(
                                    imageFiles: widget.imageFiles,
                                    initialImageIndex: entry.key,
                                    updateImageFilesStateFunc:
                                        _updateImageFilesState));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: FadeInImage(
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: FileImage(entry.value),
                              placeholder:
                                  AssetImage("assets/images/empty_image.png"),
                            ),
                          ),
                        ))
                    .toList(),
              ],
            ),
          )
        : SizedBox.shrink();
  }

  Widget _getQuestionWidgetForType(String type) {
    Widget tempQuestionWidget;

    switch (type) {
      case ANNOTATION:
        {
          break;
        }
      case BARCODE:
        {
          tempQuestionWidget = BarcodeInputWidget(
            barCode: ((widget.responseValue ?? []).length > 0)
                ? widget.responseValue[0]
                : null,
          );
          break;
        }
      case CHECK_BOX:
        {
          break;
        }
      case DATE_TIME:
        {
          break;
        }
      case INSTRUCTION:
        {
          break;
        }
      case LOCATION:
        {
          break;
        }
      case MEDIA:
        {
          tempQuestionWidget = _addMedia();
          break;
        }
      case MULTI_CHOICE:
        {
          tempQuestionWidget = MultiChoiceWidget(
            choices: ["Yes", "No", "N/A"],
            selectedList: ["Yes"],
          );
          break;
        }
      case NUMBER:
        {
          break;
        }
      case SIGNATURE:
        {
          break;
        }
      case SLIDER:
        {
          break;
        }
      case TEXT:
        {
          break;
        }
      case TEXT_AREA:
        {
          break;
        }
      default:
        {
          tempQuestionWidget = _emptyWidget();
        }
    }

    return tempQuestionWidget ?? _emptyWidget();
  }

  Widget _emptyWidget() {
    return Container(
      height: 70.0,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Palette.gray_6,
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
      ),
    );
  }
}
