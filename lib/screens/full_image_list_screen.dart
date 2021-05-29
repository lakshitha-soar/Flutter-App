import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/utils/theme_constants.dart';

class FullImageListViewScreen extends StatefulWidget {
  final List<File> imageFiles;
  final int initialImageIndex;
  final Function updateImageFilesStateFunc;

  FullImageListViewScreen(
      {Key key,
      this.imageFiles,
      this.initialImageIndex = 0,
      this.updateImageFilesStateFunc})
      : super(key: key);

  @override
  _FullImageListViewScreenState createState() =>
      _FullImageListViewScreenState();
}

class _FullImageListViewScreenState extends State<FullImageListViewScreen> {
  int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.topRight,
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
              color: Theme.of(context).backgroundColor,
              alignment: Alignment.center,
              child: Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    initialPage: widget.initialImageIndex,
                    enableInfiniteScroll: false,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                  ),
                  items: widget.imageFiles.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: FileImage(i),
                              alignment: Alignment.center,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.imageFiles.removeAt(currentPageIndex ?? 0);
                      });
                      widget.updateImageFilesStateFunc(widget.imageFiles);
                      if (widget.imageFiles.length == 0) {
                        Navigator.pop(context);
                      }
                    },
                    highlightColor: Palette.highlight,
                    overlayColor: MaterialStateProperty.all(Palette.highlight),
                    borderRadius:
                        BorderRadius.circular(ThemeConstants.borderRadius),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Palette.highlight,
                        borderRadius:
                            BorderRadius.circular(ThemeConstants.borderRadius),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: Palette.primaryColor,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenViewArguments {
  final List<File> imageFiles;
  final int initialImageIndex;
  final Function updateImageFilesStateFunc;

  FullScreenViewArguments(
      {this.imageFiles,
      this.initialImageIndex,
      this.updateImageFilesStateFunc});
}
