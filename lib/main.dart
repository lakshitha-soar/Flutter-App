import 'package:flutter/material.dart';
import 'package:soar_app/commons/theme.dart';
import 'package:soar_app/utils/utils.dart';

void main() {
  runApp(SoarApp());
}

class SoarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soar App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: PageRoutes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
