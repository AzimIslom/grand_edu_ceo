class StatisticsModel {
  late int unit;
  late double percent;
  late DateTime time;

  StatisticsModel({
    required this.time,
    required this.unit,
    required this.percent,
  });

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json['time']);
    unit = json['unit'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() => {
        'time': time.toIso8601String(),
        'unit': unit,
        'percent': percent,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
