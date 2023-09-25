
class GroupModel {
  late List<String> students;
  late String name; //
  late bool odd; //
  late DateTime start; //
  late String teacherId;
  late int unit; //
  late String branch; //
  late String id;
  late String support;
  late List<DateTime> lessons;

  GroupModel({
    required this.branch,
    required this.name,
    required this.start,
    required this.unit,
    required this.odd,
    required this.id,
    required this.teacherId,
    required this.students,
    required this.lessons,
    required this.support,
  });

  GroupModel.fromJson(Map<String, dynamic> json) {
    branch = json['branch'];
    students = List.from(json['students']);
    start = DateTime.parse(json['start']);
    name = json['name'];
    id = json['id'];
    unit = json['unit'];
    odd = json['odd'];
    teacherId = json['teacherId'];
    lessons = json['lessons'] == null
        ? []
        : List.from(json['lessons'])
        .map(
          (e) => DateTime.parse(e),
    )
        .toList();
    support = json['support'] ?? "";
  }

  Map<String, dynamic> toJson() => {
    'branch': branch,
    'students': students,
    'start': start.toIso8601String(),
    'name': name,
    'id': id,
    'unit': unit,
    'odd': odd,
    'teacherId': teacherId,
    'lessons': lessons.map((e) => e.toIso8601String()).toList(),
    'support': support,
  };

  @override
  String toString() {
    return toJson().toString();
  }
}
