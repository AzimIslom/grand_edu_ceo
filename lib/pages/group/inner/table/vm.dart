part of 'imports.dart';

class TableVM extends ChangeNotifier {
  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];
  List<AttendanceModel> table = [];
  bool isLoading = false;
  List<StudentModel> students = [];
  late GroupModel group;

  TableVM({required this.group}) {
    init();
  }

  void init() async {
    _();
    columns = [
      PlutoColumn(
        width: 170,
        minWidth: 100,
        readOnly: true,
        title: lan(t.fullname),
        field: t.fullname,
        enableDropToResize: true,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        width: 100,
        title: lan(t.status),
        enableDropToResize: true,
        readOnly: true,
        field: t.status,
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        width: 100,
        minWidth: 30,
        title: lan(t.active),
        enableDropToResize: true,
        field: t.active,
        readOnly: true,
        type: PlutoColumnType.number(),
      ),
    ];
    students = [];
    for (var i in group.students) {
      students.add(await fb.specialStudent(i));
    }
    table = group.lessons.isEmpty ? [] : await fb.attendance(group);
    rows = table
        .map(
          (e) => PlutoRow(
            cells: {
              t.fullname: PlutoCell(value: fullname(e.student)),
              t.status: PlutoCell(
                value: e.status == true
                    ? lan(t.here)
                    : e.status == false
                        ? lan(t.notHere)
                        : lan(t.haveReason),
              ),
              t.active: PlutoCell(
                value: e.stars,
              ),
            },
          ),
        )
        .toList();
    _();
  }

  String fullname(String id) {
    final s = students.firstWhere((element) => element.tel == id);
    return "${s.name} ${s.surname}";
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
