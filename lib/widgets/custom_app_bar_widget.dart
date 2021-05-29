import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/utils/theme_constants.dart';

class CustomAppBarWidget extends StatefulWidget with PreferredSizeWidget {
  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Inspections".toUpperCase(),
          style: TextStyle(
            color: Palette.gray_1,
            fontFamily: ThemeConstants.font,
            fontWeight: FontWeight.w700,
            letterSpacing: 3.0,
          ),
        ),
      ),
    );
  }
}
