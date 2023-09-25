
class SupportModel {
  late String name;
  late String tel;
  late String? password;
  late String surname;
  late String branch;

  SupportModel({
    required this.tel,
    required this.surname,
    required this.password,
    required this.name,
    required this.branch,
  });

  SupportModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    surname = json['surname'];
    password = json['password'];
    name = json['name'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() => {
    'tel': tel,
    'surname': surname,
    'password': password,
    'name': name,
    'branch': branch,
  };

  @override
  String toString() {
    return toJson().toString();
  }
}
