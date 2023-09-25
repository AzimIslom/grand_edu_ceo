part of 'imports.dart';

class AddSupportVM extends ChangeNotifier {
  late List<BranchModel> branches;
  BranchModel? branch;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  bool isLoading = false;
  List<String> errors = [];

  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  AddSupportVM({
    required this.branches,
    required this.branch,
  });

  void onChanged(val) {
    notifyListeners();
  }

  void select(String? val) {
    branch = branches.firstWhere((element) => element.short == val);
    notifyListeners();
  }

  void add(BuildContext context) async {
    errors = [];
    if (branch == null) {
      errors.add(myErrors.branchRequired);
    }
    if (firstName.text.length < 4) {
      errors.add(myErrors.firstNameRequired);
    }
    if (lastName.text.length < 4) {
      errors.add(myErrors.lastNameRequired);
    }
    if (!mask.isFill()) {
      errors.add(myErrors.telRequired);
    }
    if (errors.isEmpty) {
      _();
      final support = SupportModel(
        tel: mask.getUnmaskedText(),
        surname: lastName.text.trim(),
        name: firstName.text.trim(),
        branch: branch!.id,
        password: null,
      );
      await fb.addSupport(support);
      _();
      Navigator.pop(context);
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      if ((await Vibration.hasCustomVibrationsSupport()) ==  true) {
        Vibration.vibrate(duration: 1000);
      } else {
        Vibration.vibrate();
        await Future.delayed(Duration(milliseconds: 500));
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
