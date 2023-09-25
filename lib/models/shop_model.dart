class ShopModel {
  late int coins;
  late String title;
  late String des;
  late List<String> images;

  ShopModel({
    required this.des,
    required this.title,
    required this.coins,
    required this.images,
  });

  ShopModel.fromJson(Map<String, dynamic> json) {
    des = json['des'];
    title = json['title'];
    coins = json['coins'];
    images = List.from(json['images']);
  }

  Map<String, dynamic> toJson() => {
        'des': des,
        'title': title,
        'coins': coins,
        'images': images,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
