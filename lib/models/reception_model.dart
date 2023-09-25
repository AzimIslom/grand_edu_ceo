import 'branch_model.dart';

class ReceptionModel {
  late String name;
  late String tel;
  late String surname;
  late String branch;
  late List<String> features;
  late String? password;

  ReceptionModel({
    required this.features,
    required this.name,
    required this.branch,
    required this.password,
    required this.tel,
    required this.surname,
  });

  ReceptionModel.fromJson(Map<String, dynamic> json) {
    tel = json['tel'];
    surname = json['surname'];
    password = json['password'];
    name = json['name'];
    branch = json['branch'];
    features = List.from(json['features']);
  }

  Map<String, dynamic> toJson() => {
        'tel': tel,
        'surname': surname,
        'password': password,
        'name': name,
        'branch': branch,
        'features': features,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
