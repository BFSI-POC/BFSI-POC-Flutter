class AppConsts {
  static const String appName = 'Bfsi App';
  static const double screenWidth = 360.0;
  static const double screenHeight = 690.0;
  static const String defaultMobileCode = '91';
  static const String defaultMobileCodeId = '101';
  static const int maxWidth = 1300;
  static const int minWidth = 650;
  static const int dashMaxWidth = 1450;
  static const int tableMaxWidth = 1000;
  static const int projectDetailsWidth = 900;
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9-_!#$%&'*+/=?^`{|}~]+@[a-zA-Z0-9-_]+\.[a-zA-Z]+");
  static const String poppinsFont = 'Poppins';
  static const String mulishFont = 'Mulish';
  static const String appId = 'BfsiApp';
  static const String loginClientId = 'bfsi-app';
  static RegExp budgetRegex = RegExp(r'^0[1-9]\d{0,4}(\.\d{0,2})?$');
  static RegExp removeSplChRegX = RegExp(r'[`"~_<>!@#$%^,/?:;{|}&*+()=-]');
  static RegExp removeAlpRegX = RegExp(r'[a-zA-Z]');
  static RegExp removeFirstSpaceRegX = RegExp(r'^\s');
  static String epochTime = DateTime.now().microsecondsSinceEpoch.toString();
}
