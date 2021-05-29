import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/utils/theme_constants.dart';
import 'package:soar_app/utils/utils.dart';

class BarcodeInputWidget extends StatefulWidget {
  String barCode;

  BarcodeInputWidget({Key key, this.barCode}) : super(key: key);

  @override
  _BarcodeInputWidgetState createState() => _BarcodeInputWidgetState();
}

class _BarcodeInputWidgetState extends State<BarcodeInputWidget> {
  FocusNode barCodeInputFocusNode;
  final barCodeInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    barCodeInputFocusNode = FocusNode();
  }

  @override
  void dispose() {
    barCodeInputController.dispose();
    barCodeInputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
      ),
      child: TextField(
        onChanged: (text) {
          widget.barCode = text;
        },
        focusNode: barCodeInputFocusNode,
        controller: barCodeInputController,
        style: TextStyle(
          color: Palette.gray_1,
          fontSize: 20.0,
          letterSpacing: 1.5,
        ),
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Palette.primaryColor,
        decoration: InputDecoration(
          hintText: "Barcode Number".inCaps,
          hintStyle: TextStyle(
            color: Palette.gray_3,
            fontSize: 17.0,
            letterSpacing: 1.5,
            fontFamily: ThemeConstants.font,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
          suffixIcon: InkWell(
            onTap: () {
              _scanBarcode();
            },
            child: Icon(
              SoarIcon.barcode,
              size: 25.0,
              color: Palette.gray_1,
            ),
          ),
          filled: true,
          fillColor: Palette.gray_6,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ThemeConstants.borderRadius),
            borderSide: BorderSide(color: Palette.primaryColor),
          ),
        ),
      ),
    );
  }

  Future<void> _scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#C8394E',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        if (barcode != "-1") {
          widget.barCode = barcode;
          barCodeInputController.text = barcode;
          barCodeInputController.selection = TextSelection.fromPosition(
              TextPosition(offset: barCodeInputController.text.length));
        }
      });
    } on PlatformException {
      print('Failed to get platform version.');
    }
  }
}
