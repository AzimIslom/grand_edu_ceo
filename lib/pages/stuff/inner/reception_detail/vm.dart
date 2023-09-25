part of 'imports.dart';

class ReceptionDetailVM extends ChangeNotifier {
  late ReceptionModel reception;
  bool isLoading = false;
  late BranchModel branch;
  List<String> features = [];

  ReceptionDetailVM({
    required this.reception,
  }) {
    init();
  }

  void init() async {
    _();
    branch = await fb.specialBranch(reception.branch);
    features = reception.features;
    _();
  }

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void addFeature(String feature) {
    if (features.contains(feature)) {
      removeFeature(feature);
    } else {
      features.add(feature);
      notifyListeners();
    }
  }

  void removeFeature(String feature) {
    features.removeWhere((element) => element == feature);
    notifyListeners();
  }

  void save(BuildContext context) async {
    _();
    reception.features = features;
    await fb.saveReception(reception);
    _();
    Navigator.pop(context);
  }
}
