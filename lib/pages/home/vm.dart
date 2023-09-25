part of 'imports.dart';

class HomeVM extends ChangeNotifier {
  int currentIndex = 3;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
