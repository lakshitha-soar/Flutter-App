import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/models/survey.dart';
import 'package:soar_app/widgets/widgets.dart';

class SectionExpansionTile extends StatefulWidget {
  final String title;
  final String trailingText;
  final String score;
  final List<Questions> questions;

  SectionExpansionTile(
      {Key key, this.title, this.trailingText, this.score, this.questions})
      : super(key: key);

  @override
  _SectionExpansionTileState createState() => _SectionExpansionTileState();
}

class _SectionExpansionTileState extends State<SectionExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Container(
        height: double.infinity,
        margin: EdgeInsets.only(
          left: 10,
        ),
        child: RotatedBox(
          quarterTurns: (_isExpanded ?? false) ? (-4) : -1,
          child: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 30.0,
            color:
                (_isExpanded ?? false) ? Palette.primaryColor : Palette.gray_1,
          ),
        ),
      ),
      expandedAlignment: Alignment.center,
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      trailing: (widget.trailingText != null)
          ? Container(
              margin: EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                widget.trailingText,
                style: TextStyle(
                  color: (_isExpanded ?? false)
                      ? Palette.primaryColor
                      : Palette.gray_1,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ))
          : SizedBox.shrink(),
      title: Container(
        child: Text(
          widget.title,
          style: TextStyle(
            color:
                (_isExpanded ?? false) ? Palette.primaryColor : Palette.gray_1,
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
      collapsedBackgroundColor: Palette.highlight,
      backgroundColor: Palette.highlight,
      onExpansionChanged: (value) {
        _isExpanded = value;
        setState(() {});
      },
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Palette.gray_5,
              ),
              BoxShadow(
                color: Palette.gray_7,
                spreadRadius: -1.0,
                blurRadius: 30.0,
                offset: Offset(0.0, -10.0),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                ...widget.questions
                    .map((question) => _sectionItem(question))
                    .toList(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget _sectionItem(Questions question) {
  return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      child: Transform.scale(
          scale: 0.9,
          child: QuestionWidget(
              questions: question,
              imageFiles: [],
              note: "")));
}
