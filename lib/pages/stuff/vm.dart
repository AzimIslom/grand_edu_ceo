part of 'imports.dart';

class StuffVM extends ChangeNotifier {
  List<TeacherModel> teachers = [];
  BranchModel? branch;
  List<BranchModel> branches = [];

  StuffVM() {
    initBranches();
  }

  void initBranches() async {
    branches = await fb.branches();
    notifyListeners();
  }

  void select(String? val) {
    branch = branches.firstWhere((element) => element.short == val);
    notifyListeners();
  }
}
