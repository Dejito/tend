import 'dart:ui';


class AppColors {
  static const primaryColor = Color(0xFF2957C5);
  static Color scaffoldBackgroundColor = const Color(0xFFF5F9FC);
  static Color inputFieldBorderColor = const Color(0xFF343A40);
  static Color inputErrorBorder = const Color(0xFFEB5757);
  static Color textBlue = const Color(0xFF2957C5);
  static Color inputFieldColor = const Color(0xFFEDEDED);
  static Color white = const Color(0xFFFFFFFF);
  static Color inputBorderColor = const Color(0xFFD9D9D9);
  static Color textLabelColor = const Color(0xFF52525C);
  static Color borderColor = const Color(0XFFB3B3B3);
  static const Color primaryFourElementText = Color.fromARGB(255, 204, 204, 204);
  static Color transactionSuccessful = const Color(0xFFB9E3BD);
  static Color transactionPending = const Color(0xFFFFEFB0);
  static Color transactionFailed = const Color(0xFFFF8B7B);
  static Color transactionSuccessful2 = const Color(0xFF34BC41);

  static final pieChartColorList = <Color>[
    transactionSuccessful,
    transactionPending,
    transactionFailed
  ];
}