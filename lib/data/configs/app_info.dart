import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../__lib.dart';

class AppInfo {
  static const bool isWeb = kIsWeb;
  static final TextTheme appTextTheme = GoogleFonts.poppinsTextTheme();
  static const MaterialColor appPrimarySwatch = Colors.green;

  static const String appTitle = 'Fitness UI';
  static String appLogo = AppAssets.ASSETS_LOGO_PNG;
  static const tandcUrl = '';
}
