import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:soar_app/configs/palette.dart';
import 'package:soar_app/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          foregroundDecoration: BoxDecoration(
              // color: Palette.gray_1,
              // backgroundBlendMode: BlendMode.saturation,
              ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -130.0,
                top: -20.0,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(45 / 360),
                  child: Container(
                    width: 255,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Palette.highlight.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Palette.primaryColor.withOpacity(0.3),
                        width: 1.0,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RotationTransition(
                                turns: new AlwaysStoppedAnimation(-45 / 360),
                                child: Icon(
                                  SoarIcon.soar,
                                  size: 70.0,
                                  color: Palette.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -200.0,
                bottom: -50,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(45 / 360),
                  child: Container(
                    width: 255,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Palette.highlight.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Palette.primaryColor.withOpacity(0.3),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -200.0,
                top: 70.0,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(60 / 360),
                  child: Container(
                    width: 255,
                    height: 280,
                    decoration: BoxDecoration(
                      // color: Palette.highlight.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Palette.primaryColor.withOpacity(0.3),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -150.0,
                bottom: -70.0,
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(30 / 360),
                  child: Container(
                    width: 255,
                    height: 280,
                    decoration: BoxDecoration(
                      // color: Palette.highlight.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Palette.primaryColor.withOpacity(0.3),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 40.0),
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.0,
                                vertical: 5.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ThemeConstants.borderRadius),
                              ),
                              child: Text(
                                (isSmallThanDesignedSize(context))
                                    ? ""
                                    : "login".toUpperCase(),
                                style: TextStyle(
                                  color: Palette.gray_2,
                                  fontFamily: ThemeConstants.font,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 3.0,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ThemeConstants.borderRadius),
                            color: Palette.gray_6,
                          ),
                          child: _userName(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ThemeConstants.borderRadius),
                            color: Palette.gray_6,
                          ),
                          child: _password(),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: InkWell(
                            highlightColor: Palette.highlight,
                            overlayColor:
                                MaterialStateProperty.all(Palette.highlight),
                            onTap: () {
                              print("Forgot Password ?");
                            },
                            child: Text(
                              "Forgot Password ?".inCaps,
                              style: TextStyle(
                                color: Palette.primaryColor,
                                fontSize: 13.0,
                                letterSpacing: 1.5,
                                fontFamily: ThemeConstants.font,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        InkWell(
                          onTap: () {
                            if(_formKey.currentState.validate()) {
                              print("validated");

                              Navigator.of(context)
                                  .pushNamed(PageRoutes.bottomNavigationAppBar);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 40.0),
                            decoration: BoxDecoration(
                              color: Palette.primaryColor,
                              borderRadius: BorderRadius.circular(
                                  ThemeConstants.borderRadius),
                            ),
                            child: Text(
                              "Login".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Palette.bottom_popup_text_color,
                                fontFamily: ThemeConstants.font,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                letterSpacing: 3.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Don't Have An Account ?",
                                style: TextStyle(
                                  color: Palette.gray_2,
                                  fontSize: 13.0,
                                  letterSpacing: 1.5,
                                  fontFamily: ThemeConstants.font,
                                ),
                              ),
                            ),
                            Container(
                              child: InkWell(
                                highlightColor: Palette.highlight,
                                overlayColor: MaterialStateProperty.all(
                                    Palette.highlight),
                                onTap: () {
                                  print("SignUp Here");
                                },
                                child: Text(
                                  " SignUp Here",
                                  style: TextStyle(
                                    color: Palette.primaryColor,
                                    fontSize: 13.0,
                                    letterSpacing: 1.5,
                                    fontFamily: ThemeConstants.font,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextFormField _userName() {
  return TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        print("Please enter user name");
        return "  Please enter user name";
      }
      return null;
    },
    style: TextStyle(
      color: Palette.gray_1,
      fontSize: 20.0,
      letterSpacing: 1.5,
    ),
    textAlignVertical: TextAlignVertical.center,
    cursorColor: Palette.primaryColor,
    decoration: InputDecoration(
      hintText: "User Name".inCaps,
      hintStyle: TextStyle(
        color: Palette.gray_3,
        fontSize: 17.0,
        letterSpacing: 1.5,
        fontFamily: ThemeConstants.font,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      prefixIcon: Icon(
        FontAwesomeIcons.userAlt,
        size: 25.0,
        color: Palette.gray_4,
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
  );
}

TextFormField _password() {
  return TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        print("Please enter password");
        return "  Please enter password";
      }
      return null;
    },
    obscureText: true,
    style: TextStyle(
      color: Palette.gray_1,
      fontSize: 20.0,
      letterSpacing: 1.5,
    ),
    textAlignVertical: TextAlignVertical.center,
    cursorColor: Palette.primaryColor,
    decoration: InputDecoration(
      hintText: "Password".inCaps,
      hintStyle: TextStyle(
        color: Palette.gray_3,
        fontSize: 17.0,
        letterSpacing: 1.5,
        fontFamily: ThemeConstants.font,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      prefixIcon: Icon(
        Icons.vpn_key,
        size: 30.0,
        color: Palette.gray_4,
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
  );
}
