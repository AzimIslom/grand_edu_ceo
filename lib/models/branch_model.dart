class BranchModel {
  late String short;
  late String long;
  late List<String> tels;
  late String id;
  late double lan;
  late double lat;

  BranchModel({
    required this.lan,
    required this.lat,
    required this.long,
    required this.short,
    required this.id,
    required this.tels,
  });

  BranchModel.fromJson(Map<String, dynamic> json) {
    lan = json['lan'];
    lat = json['lat'];
    long = json['long'];
    short = json['short'];
    id = json['id'];
    tels = List.from(json['tels']);
  }

  Map<String, dynamic> toJson() => {
        'lan': lan,
        'lat': lat,
        'long': long,
        'short': short,
        'id': id,
        'tels': tels,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
