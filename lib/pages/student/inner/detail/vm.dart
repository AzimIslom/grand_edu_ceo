part of 'imports.dart';

class StudentDetailVM extends ChangeNotifier {
  late StudentModel student;
  late GroupModel group;
  late TeacherModel teacher;

  bool isLoading = false;
  late int xp;
  final mask = MaskTextInputFormatter(
    mask: '(##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  StudentDetailVM({
    required this.student,
  }) {
    init();
  }

  void init() async {
    _();
    group = await fb.specialGroup(student.groupId);
    teacher = await fb.specialTeacher(group.teacherId);
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
