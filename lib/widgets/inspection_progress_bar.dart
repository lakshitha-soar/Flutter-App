import 'package:flutter/material.dart';
import 'package:soar_app/configs/palette.dart';

class InspectionProgressBar extends StatefulWidget {

  final double progressLevel;

  InspectionProgressBar({@required this.progressLevel});

  @override
  _InspectionProgressBarState createState() => _InspectionProgressBarState();
}

class _InspectionProgressBarState extends State<InspectionProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: widget.progressLevel).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  LinearProgressIndicator(
      value: animation.value,
      backgroundColor: Palette.gray_5,
      valueColor: AlwaysStoppedAnimation<Color>(
          Palette.primaryColor),
    );
  }
}
