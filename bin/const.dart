class Const {
  static const String SIZE_ARG = 'size';
  static const String COLOR_ARG = 'color';
  static const String DECO_ARG = 'deco';

  static const String GREEN_COL = '\u001b[32;1m';
  static const String BLACK_COL = '\u001b[30;1m';
  static const String YELLOW_COL = '\u001b[33;1m';
  static const String RESET_COL = '\u001b[0m';

  static const int DEFAULT_SIZE = 4;
  static const int MIN_SIZE = 2;
  static const int MAX_SIZE = 10;

  static const bool DEFAULT_COLOR = false;
  static const bool DEFAULT_DECO = false;

  static const String DECO_CANDIDATES = '*.-\'o+@';
}
