import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/utils/utils.dart';

class MultiChoiceWidget extends StatefulWidget {
  List<String> choices;
  bool isMultiChoice;
  List<String> selectedList;

  MultiChoiceWidget(
      {Key key, this.choices, this.isMultiChoice = false, this.selectedList})
      : super(key: key);

  @override
  _MultiChoiceWidgetState createState() => _MultiChoiceWidgetState();
}

class _MultiChoiceWidgetState extends State<MultiChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          ...widget.choices
              .map((choice) => InkWell(
                    onTap: () {
                      setState(() {
                        if (!_isAlreadySelectedItem(choice)) {
                          if (widget.isMultiChoice) {
                            widget.selectedList.add(choice);
                          } else {
                            widget.selectedList = [choice];
                          }
                        } else {
                          if (widget.isMultiChoice) {
                            if(widget.selectedList.length > 1) {
                              widget.selectedList.remove(choice);
                            }
                          }
                        }
                      });
                    },
                    child: Container(
                      width: 400.0,
                      margin: EdgeInsets.only(top: 10.0),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      decoration: BoxDecoration(
                        color: (_isAlreadySelectedItem(choice))
                            ? Palette.primaryColor
                            : null,
                        borderRadius:
                            BorderRadius.circular(ThemeConstants.borderRadius),
                        border: Border.all(
                          color: Palette.primaryColor,
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        choice.inCaps,
                        style: TextStyle(
                          color: (_isAlreadySelectedItem(choice))
                              ? Palette.bottom_popup_text_color
                              : Palette.gray_2,
                          fontFamily: ThemeConstants.font,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  bool _isAlreadySelectedItem(String currentChoice) {
    return ((widget.selectedList ?? []).indexOf(currentChoice) > -1);
  }
}
