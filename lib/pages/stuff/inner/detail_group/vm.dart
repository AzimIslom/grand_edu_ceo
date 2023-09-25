part of 'imports.dart';

class GroupDetailVM extends ChangeNotifier {
  late GroupModel group;
  bool isLoading = false;

  GroupDetailVM({
    required this.group,
  });

  Future<List<StudentModel>> getStudents() async {
    final List<StudentModel> students = [];
    for (var i in group.students) {
      students.add(await fb.specialStudent(i));
    }
    return students;
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
