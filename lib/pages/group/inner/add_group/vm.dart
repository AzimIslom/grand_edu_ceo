part of 'imports.dart';

class AddGroupVM extends ChangeNotifier {
  late List<BranchModel> branches;
  late BranchModel? branch;
  TextEditingController name = TextEditingController();
  int? time;
  bool? isFirstLesson;
  int unit = 0;
  bool? isOdd;
  TeacherModel? teacher;
  SupportModel? support;
  List<String> errors = [];
  List<TeacherModel> teachers = [];
  List<SupportModel> supports = [];
  bool isLoading = false;

  AddGroupVM({
    required this.branches,
    required this.branch,
  }) {
    init();
  }

  void init() async {
    teachers = await fb.teachers();
    supports = await fb.supports();
    notifyListeners();
  }

  void select(String? val) {
    branch = branches.firstWhere((element) => element.short == val);
    notifyListeners();
  }

  void selectTeacher(TeacherModel teacher) {
    this.teacher = teacher;
    notifyListeners();
  }

  void selectSupport(SupportModel support) {
    this.support = support;
    notifyListeners();
  }

  void selectTime(int index) {
    time = index;
    notifyListeners();
  }

  void selectDay(bool val) {
    isOdd = val;
    notifyListeners();
  }

  void selectUnit(int n) {
    unit = n;
    notifyListeners();
  }

  void firstLesson(bool val) {
    isFirstLesson = val;
    notifyListeners();
  }

  void save(BuildContext context) async {
    _();

    errors = [];
    if (branch == null) {
      errors.add(t.branch);
    }
    if (teacher == null) {
      errors.add(t.selectTeacher);
    }
    if (support == null) {
      errors.add(t.selectSupport);
    }
    if (name.text.trim().isEmpty) {
      errors.add(t.groupName);
    }
    if (time == null) {
      errors.add(t.startTime);
    }
    if (isOdd == null) {
      errors.add(t.dayLesson);
    }
    if (unit == 0) {
      errors.add(t.unit);
    }
    if (errors.isEmpty) {
      final group = GroupModel(
        branch: branch!.id,
        name: name.text.trim(),
        start: DateTime(
            2023,
            1,
            1,
            time! == 1
                ? 14
                : time! == 2
                    ? 16
                    : 18,
            0),
        unit: unit,
        odd: isOdd!,
        id: 'id',
        teacherId: teacher!.tel,
        students: [],
        lessons: [],
        support: support!.tel,
      );
      print(group.toJson());
      await fb.addGroup(group);
      _();
      Navigator.pop(context, 'xd');
    } else {
      _();
      FocusManager.instance.primaryFocus?.unfocus();
      if ((await Vibration.hasCustomVibrationsSupport()) == true) {
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

  List<ThemeModel> themes = [
    ThemeModel(
      title: "Boshlang’ich tushunchalar. Hisoblashga doir misollar.",
      unit: 1,
    ),
    ThemeModel(
      title: "Bo’linish belgilari.",
      unit: 2,
    ),
    ThemeModel(
      title: "Qoldiqli bo’lish. EKUK va EKUB.",
      unit: 3,
    ),
    ThemeModel(
      title: "Kasrlar.",
      unit: 4,
    ),
    ThemeModel(
      title: "O’nli kasrlar ustida amallar. Cheksiz davriy o’nli kasrlar.",
      unit: 5,
    ),
    ThemeModel(
      title: "Algebraik ifodalar.",
      unit: 6,
    ),
    ThemeModel(
      title: "Ko’phadlarni ko’paytuvchilarga ajratish.",
      unit: 7,
    ),
    ThemeModel(
      title: "Chiziqli tenglamalar. Proportsiya.",
      unit: 8,
    ),
    ThemeModel(
      title: "Tenglamalar sistemasi.",
      unit: 9,
    ),
  ];
}
