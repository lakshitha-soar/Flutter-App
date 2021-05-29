import 'dart:io';

import 'package:flutter/material.dart';
import 'package:soar_app/models/inspection.dart';
import 'package:soar_app/models/template.dart';
import 'package:soar_app/screens/screens.dart';
import 'package:soar_app/utils/utils.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case PageRoutes.bottomNavigationAppBar:
        return MaterialPageRoute(builder: (_) => BottomNavigationScreen());
        break;
      case PageRoutes.newInspectionQuestionScreen:
        if (args is Template) {
          return MaterialPageRoute(
              builder: (_) => NewInspectionQuestionScreen());
        }
        break;
      case PageRoutes.draftedInspectionQuestionScreen:
        if (args is Inspection) {
          return MaterialPageRoute(
              builder: (_) => DraftedInspectionQuestionScreen(
                    inspection: args,
                  ));
        }
        break;

      case PageRoutes.fullImageListViewScreen:
        if (args is FullScreenViewArguments) {
          return MaterialPageRoute(
              builder: (_) => FullImageListViewScreen(
                    imageFiles: args.imageFiles,
                    initialImageIndex: args.initialImageIndex,
                    updateImageFilesStateFunc: args.updateImageFilesStateFunc,
                  ));
        }
        break;
    }
  }
}
