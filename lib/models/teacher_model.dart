
class TeacherModel {
  late String name;
  late String tel;
  late String? password;
  late String surname;
  late String branch;
  late List<String> groups;
  late List<String> students;

  TeacherModel({
    required this.tel,
    required this.surname,
    required this.password,
    required this.name,
    required this.branch,
    required this.students,
    required this.groups,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    surname = json['surname'];
    password = json['password'];
    name = json['name'];
    branch = json['branch'];
    students = List.from(json['students']);
    groups = List.from(json['groups']);
  }

  Map<String, dynamic> toJson() => {
        'tel': tel,
        'surname': surname,
        'password': password,
        'name': name,
        'branch': branch,
        'students': students,
        'groups': groups,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
