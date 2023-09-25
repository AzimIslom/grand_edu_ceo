part of 'imports.dart';

class StudentVM extends ChangeNotifier {
  TextEditingController search = TextEditingController();
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  StudentVM() {
    search.addListener(() {
      notifyListeners();
    });
  }
}
