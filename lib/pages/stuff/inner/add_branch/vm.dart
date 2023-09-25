part of 'imports.dart';

class AddBranchVM extends ChangeNotifier {
  TextEditingController short = TextEditingController();
  TextEditingController long = TextEditingController();
  List<TextEditingController> tels = [];
  List<String> errors = [];
  bool isLoading = false;

  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  void addMask() {
    tels.add(TextEditingController());
    notifyListeners();
  }

  void removeMask(TextEditingController controller) {
    tels.remove(controller);
    notifyListeners();
  }

  void save(BuildContext context) async {
    errors = [];
    if (short.text.isEmpty) {
      errors.add(t.name);
    }
    if (long.text.isEmpty) {
      errors.add(t.address);
    }
    if (tels.isEmpty ||
        tels.where((element) => element.text.length != 12).isNotEmpty) {
      errors.add(t.tel);
    }
    if (errors.isEmpty) {
      _();
      final t = tels
          .map((e) => e.text
              .split('')
              .where((element) => int.tryParse(element) != null)
              .join())
          .toList();
      final branch = BranchModel(
        lan: -1,
        lat: -1,
        long: long.text,
        short: short.text,
        id: 'a',
        tels: t,
      );
      await fb.addBranch(branch);
      _();
      Navigator.pop(context);
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      if ((await Vibration.hasCustomVibrationsSupport()) == true) {
        Vibration.vibrate(duration: 1000);
      } else {
        Vibration.vibrate();
        await Future.delayed(const Duration(milliseconds: 500));
        Vibration.vibrate();
      }
      notifyListeners();
    }
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
