part of 'imports.dart';

class StudentTableVM extends ChangeNotifier {
  List<TeacherModel> teachers = [];
  List<ReceptionModel> receptions = [];
  List<SupportModel> supports = [];
  bool isLoading = false;

  StudentTableVM() {
    init();
  }

  Future<List<AttendanceModel>> table() async {
    return List.generate(
      10,
      (index) => AttendanceModel(
        by: 't.990330919',
        des: [
          TableDesModel(
            des: "teacher: ${faker.lorem.sentence()}",
            by: "r.894982394",
            time: DateTime.now(),
          ),
          TableDesModel(
            des: "reception: ${faker.lorem.sentence()}",
            by: "t.990330919",
            time: DateTime.now(),
          ),
          TableDesModel(
            des: "support: ${faker.lorem.sentence()}",
            by: "s.829138938",
            time: DateTime.now(),
          ),
        ],
        time: DateTime.now(),
        student: 'me',
        status: index % 2 == 0
            ? true
            : index % 3 == 0
                ? false
                : null, stars: 3,
      ),
    );
  }

  void init() async {
    _();
    teachers = await fb.teachers();
    receptions = await fb.receptions();
    supports = await fb.supports();
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }

  String name(String id) {
    List<String> parts = id.split('.');
    print(parts);
    print(teachers);
    print(receptions);
    if (parts.first == "t") {
      final t = teachers.firstWhere((element) => element.tel == parts.last);
      return "${t.name} ${t.surname}";
    } else if (parts.first == 'r'){
      final r = receptions.firstWhere((element) => element.tel == parts.last);
      return "${r.name} ${r.surname}";
    } else {
      final s = supports.firstWhere((element) => element.tel == parts.last);
      return "${s.name} ${s.surname}";
    }
  }
}
