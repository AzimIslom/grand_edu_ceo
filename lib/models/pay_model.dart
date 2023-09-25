class PayModel {
  late DateTime time;
  late String des;
  late String payer;
  late String getter;
  late String id;
  late int lessons;
  late int sum;

  PayModel({
    required this.time,
    required this.des,
    required this.id,
    required this.getter,
    required this.lessons,
    required this.payer,
    required this.sum,
  });

  PayModel.fromJson(Map<String, dynamic> json) {
    time = DateTime.parse(json['time']);
    des = json['des'];
    id = json['id'];
    getter = json['getter'];
    lessons = json['lessons'];
    payer = json['payer'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() => {
        'time': time.toIso8601String(),
        'des': des,
        'id': id,
        'getter': getter,
        'lessons': lessons,
        'payer': payer,
        'sum': sum,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
