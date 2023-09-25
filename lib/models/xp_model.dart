class XPModel {
  late int xp;
  late DateTime time;
  late String cause;

  XPModel({
    required this.xp,
    required this.time,
    required this.cause,
  });

  XPModel.fromJson(Map<String, dynamic> json) {
    xp = json['xp'];
    time = DateTime.parse(json['time']);
    cause = json['cause'];
  }

  Map<String, dynamic> toJson() => {
        'xp': xp,
        'time': time.toIso8601String(),
        'cause': cause,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
