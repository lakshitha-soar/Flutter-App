import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/screens/screens.dart';
import 'package:soar_app/utils/utils.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<IconData> _iconList = [
    SoarIcon.soar,
    SoarIcon.clipboard,
    SoarIcon.issue_opened,
    SoarIcon.tag,
    SoarIcon.more_horiz
  ];

  final List<String> _titleList = [
    "Overview",
    "Inspections",
    "Issues",
    "Actions",
    "More"
  ];

  final List _screens = [
    Scaffold(),
    InspectionsScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Palette.gray_5,
                blurRadius: 20,
              ),
            ],
          ),
          child: BottomNavigationBar(
            onTap: (index) => {
              setState(() {
                _currentIndex = index;
              })
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Palette.primaryColor,
            unselectedItemColor: Palette.gray_3,
            items: [
              ..._iconList
                  .asMap()
                  .entries
                  .map((entry) => BottomNavigationBarItem(
                        icon: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
                            border: _currentIndex == entry.key
                                ? Border.all(
                                    color: Palette.primaryColor,
                                    width: 1.5,
                                  )
                                : null,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  entry.value,
                                  color: _currentIndex == entry.key
                                      ? Palette.primaryColor
                                      : Palette.gray_3,
                                  size: 25,
                                ),
                                SizedBox(height: 5),
                                Text(_titleList[entry.key], style: TextStyle(
                                  fontFamily: ThemeConstants.font,
                                  fontSize: 10.0,
                                  color: _currentIndex == entry.key
                                      ? Palette.primaryColor
                                      : Palette.gray_3,
                                ),),
                              ],
                            ),
                          ),
                        ),
                        title: SizedBox.shrink(),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
