part of 'utils.dart';

final c = C.instance;

class C {
  C._();

  static C instance = C._();
  bool isLight = false;

  Color get yellow => const Color(0xffffc700);
  Color get black => const Color(0xff090b0a);
  Color get green => const Color(0xff22c16c);
  Color get white => const Color(0xffffffff);
  Color get red => const Color(0xffef573f);
  Color get blue => const Color(0xff0278ff);
}
