part of 'imports.dart';

class TeacherDetailVM extends ChangeNotifier {
  late TeacherModel teacher;
  List<GroupModel> groups = [];
  List<StudentModel> students = [];
  bool isLoading = false;
  late BranchModel branch;

  TextEditingController search = TextEditingController();
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  TeacherDetailVM({
    required this.teacher,
  }) {
    init();
    search.addListener(() {
      notifyListeners();
    });
  }

  void init() async {
    _();
    final g = teacher.groups;
    groups = [];
    students = [];
    for (var group in g) {
      final gr = await fb.specialGroup(group);
      groups.add(gr);
      for (var s in gr.students) {
        students.add(await fb.specialStudent(s));
      }
      print(students);
    }
    branch = await fb.specialBranch(teacher.branch);
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }

  GroupModel group(String id) => groups.firstWhere((element) => element.id == id);
}
