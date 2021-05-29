import 'package:flutter/material.dart';
import 'package:soar_app/utils/utils.dart';

class NameValueWidget extends StatelessWidget {
  final String name;
  final String value;
  final double width;

  NameValueWidget({this.name, this.value, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          (isSmallThanDesignedSize(context))
              ? SizedBox()
              : Text(
                  name.inCaps,
                  style: TextStyle(
                    fontFamily: ThemeConstants.font,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.0,
                  ),
                ),
          SizedBox(
            width: (isSmallThanDesignedSize(context)) ? 0 : 3,
          ),
          (isSmallThanDesignedSize(context)) ? SizedBox() : Text(":"),
          SizedBox(
            width: (isSmallThanDesignedSize(context)) ? 0 : 5,
          ),
          Container(
            width: width != null ? width : null,
            child: Text(
              value.inCapsAll,
              style: TextStyle(
                fontFamily: ThemeConstants.font,
                fontSize: 11.0,
                fontWeight: (isSmallThanDesignedSize(context)) ? FontWeight.bold : FontWeight.normal,
              ),
              overflow: !(isTabSize(context)) ? TextOverflow.ellipsis : null,
            ),
          ),
        ],
      ),
    );
  }
}
