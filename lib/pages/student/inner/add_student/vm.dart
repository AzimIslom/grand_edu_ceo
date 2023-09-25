part of 'imports.dart';

class AddStudentVM extends ChangeNotifier {
  List<GroupModel> groups = [];
  List<TeacherModel> teachers = [];
  GroupModel? group;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  bool isLoading = false;
  List<String> errors = [];

  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  void onChanged(val) {
    notifyListeners();
  }

  void add(BuildContext context) async {
    errors = [];
    if (group == null) {
      errors.add(myErrors.groupRequired);
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
      final teacher = StudentModel(
        tel: mask.getUnmaskedText(),
        surname: lastName.text.trim(),
        name: firstName.text.trim(),
        password: null,
        groupId: group!.id,
        xp: 0,
        lessons: 0,
        teacherId: group!.teacherId,
        supportId: group!.support,
      );
      await fb.addStudent(teacher);
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

  AddStudentVM() {
    initGroups();
    initTeachers();
  }

  void initGroups() async {
    groups = await fb.groups();
    notifyListeners();
  }

  void initTeachers() async {
    teachers = await fb.teachers();
    notifyListeners();
  }

  void selectGroup(GroupModel group) {
    this.group = group;
    notifyListeners();
  }

  String currentTeacher(String id) {
    String name = teachers.firstWhere((element) => element.tel == id).name;
    String surname =
        teachers.firstWhere((element) => element.tel == id).surname;
    return "$name $surname";
  }
}
