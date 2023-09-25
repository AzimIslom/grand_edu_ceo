class ThemeModel {
  late int unit;
  late String title;

  ThemeModel({
    required this.title,
    required this.unit,
  });

  ThemeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'unit': unit,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
