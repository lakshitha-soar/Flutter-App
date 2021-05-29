import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/utils/theme_constants.dart';

class TextAreaWidget extends StatefulWidget {
  @override
  _TextAreaWidgetState createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
  double height = 100;
  double width = double.infinity;

  double bottom = -7.0;
  double right = -7.0;

  final myController = TextEditingController();

  void onDrag(double dx, double dy) {
    var newHeight = height + dy;
    var newWidth = width + dx;

    setState(() {
      height = newHeight > 0 ? newHeight : 0;
      width = newWidth > 0 ? newWidth : 0;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: height,
          width: width,
          child: TextField(
            minLines: null,
            maxLines: null,
            expands: true,
            controller: myController,
            onChanged: (text) {
              print('$text');
            },
            style: TextStyle(
              color: Palette.gray_1,
              fontSize: 20.0,
              letterSpacing: 1.5,
            ),
            textAlignVertical: TextAlignVertical.top,
            cursorColor: Palette.primaryColor,
            decoration: InputDecoration(
              hintText: "Add note",
              hintStyle: TextStyle(
                color: Palette.gray_3,
                fontSize: 17.0,
                letterSpacing: 1.5,
                fontFamily: ThemeConstants.font,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              filled: true,
              fillColor: Palette.gray_6,
              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConstants.borderRadius),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(ThemeConstants.borderRadius),
                borderSide: BorderSide(color: Palette.primaryColor),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: bottom,
            right: right,
            child: SizeHandler(
              onDrag: (dx, dy) {
                var newHeight = height + dy;
                var newWidth = width + dx;

                setState(() {
                  height = (newHeight < 100) ? 100 : newHeight;
                  // width = newWidth;
                });
              },
            )),
      ],
    );
  }
}

class SizeHandler extends StatefulWidget {
  SizeHandler({Key key, this.onDrag});

  final Function onDrag;

  @override
  _SizeHandlerState createState() => _SizeHandlerState();
}

class _SizeHandlerState extends State<SizeHandler> {
  double initX;
  double initY;
  bool active = false;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        print("pan start");
        setState(() {
          active = true;
        });
        _handleDrag(details);
      },
      onVerticalDragUpdate: _handleUpdate,
      onPanEnd: (details) {
        setState(() {
          active = false;
        });
      },
      child: Container(
        color: Colors.white.withOpacity(0.0),
        padding: EdgeInsets.only(
          top: 45.0,
          left: 35.0,
          bottom: 20.0,
          right: 20.0,
        ),
        child: SvgPicture.asset(
          "assets/icons/expand.svg",
          color: (active) ? Palette.primaryColor : Palette.gray_3,
          width: 15.0,
          height: 15.0,
        ),
      ),
    );
  }
}
