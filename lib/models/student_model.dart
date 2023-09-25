class StudentModel {
  late String groupId;
  late String tel;
  late String teacherId;
  late String supportId;
  late String name;
  late String surname;
  late String? password;
  late int xp;
  late int lessons;

  StudentModel({
    required this.surname,
    required this.name,
    required this.tel,
    required this.password,
    required this.groupId,
    required this.xp,
    required this.lessons,
    required this.teacherId,
    required this.supportId,
  });

  StudentModel.fromJson(Map<String, dynamic> json) {
    surname = json['surname'];
    name = json['name'];
    tel = json['tel'];
    password = json['password'];
    groupId = json['groupId'];
    xp = json['xp'] ?? 0;
    lessons = json['lessons'] ?? 0;
    teacherId = json['teacherId'] ?? "";
    supportId = json['supportId'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'surname': surname,
        'name': name,
        'tel': tel,
        'password': password,
        'groupId': groupId,
        'xp': xp,
        'lessons': lessons,
        'teacherId': teacherId,
        'supportId': supportId,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
