import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

bool kUseFakeRepos = String.fromEnvironment('useFakeRepos') == 'true';
final log = Logger();

/// A simple placeholder that can be used to search all the hardcoded
/// and for-test strings, colors, ints, doubles
/// in the code (useful to identify strings that need to be localized).
extension StringHardcoded on String {
  String get hcd => this;
  String get tt => this;
}

extension ColorHardcoded on Color {
  Color get hcd => this;
  Color get tt => this;
}

extension IntHardcoded on int {
  int get hcd => this;
  int get tt => this;
}

extension DoubleHardcoded on double {
  double get hcd => this;
  double get tt => this;
}
