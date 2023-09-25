class CommentModel {
  late DateTime time;
  late String by;
  late String des;
  late String type;
  late String to;

  CommentModel({
    required this.des,
    required this.time,
    required this.by,
    required this.to,
    required this.type,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    des = json['des'];
    time = DateTime.parse(json['time']);
    by = json['by'];
    to = json['to'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() => {
        'des': des,
        'time': time.toIso8601String(),
        'by': by,
        'to': to,
        'type': type,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
