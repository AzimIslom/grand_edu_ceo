class AttendanceModel {
  late String student;
  late DateTime time;
  late List<TableDesModel> des;
  late bool? status;
  late String by;
  late int stars;

  AttendanceModel({
    required this.by,
    required this.des,
    required this.time,
    required this.student,
    required this.status,
    required this.stars,
  });

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    des = List.from(json['des'])
        .map(
          (e) => TableDesModel.fromJson(e),
        )
        .toList();
    time = DateTime.parse(json['time']);
    student = json['student'];
    status = json['status'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() => {
        'by': by,
        'des': des.map((e) => e.toJson()).toList(),
        'time': time.toIso8601String(),
        'student': student,
        'status': status,
        'stars': stars,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}

class TableDesModel {
  late DateTime time;
  late String by;
  late String des;

  TableDesModel({
    required this.des,
    required this.by,
    required this.time,
  });

  TableDesModel.fromJson(Map<String, dynamic> json) {
    des = json['des'];
    by = json['by'];
    time = DateTime.parse(json['time']);
  }

  Map<String, dynamic> toJson() => {
        'des': des,
        'by': by,
        'time': time.toIso8601String(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
