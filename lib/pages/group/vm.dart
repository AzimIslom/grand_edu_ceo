part of 'imports.dart';

class GroupVM extends ChangeNotifier {
  List<TeacherModel> teachers = [];
  BranchModel? branch;
  List<BranchModel> branches = [];
  bool isLoading = false;

  GroupVM() {
    init();
  }

  Future<void> init() async {
    _();
    branches = await fb.branches();
    teachers = await fb.teachers();
    _();
  }

  void select(String? branch) {
    this.branch = branches.firstWhere((element) => element.short == branch);
    notifyListeners();
  }

  String currentTeacher(String id) {
    String name = teachers.firstWhere((element) => element.tel == id).name;
    String surname =
        teachers.firstWhere((element) => element.tel == id).surname;
    return "$name $surname";
  }

  TeacherModel currTeacher(String id) {
    return teachers.firstWhere((element) => element.tel == id);
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
