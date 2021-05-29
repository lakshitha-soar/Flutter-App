import 'package:flutter/cupertino.dart';

bool isSmallThanDesignedSize(BuildContext context) => ((MediaQuery.of(context).size.width) < 428.0);
bool isTabSize(BuildContext context) => ((MediaQuery.of(context).size.width) > 600.0);
