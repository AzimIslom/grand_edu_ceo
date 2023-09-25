class CatModel {
  late int unit;
  late int cat;
  late String title;

  CatModel({
    required this.unit,
    required this.title,
    required this.cat,
  });

  CatModel.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    title = json['title'];
    cat = json['cat'];
  }

  Map<String, dynamic> toJson() => {
        'unit': unit,
        'title': title,
        'cat': cat,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
