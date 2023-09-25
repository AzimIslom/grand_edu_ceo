part of 'imports.dart';

class StudentPaymentDetailVM extends ChangeNotifier {
  List<ReceptionModel> receptions = [];
  bool isLoading = false;

  StudentPaymentDetailVM() {
    init();
  }

  Future<List<PayModel>> payments() async {
    return List.generate(
      10,
      (index) => PayModel(
        time: DateTime.now(),
        des: faker.lorem.sentence(),
        id: 'id',
        getter: '894982394',
        lessons: 3,
        payer: 'pa',
        sum: index * 100000,
      ),
    );
  }

  void init() async {
    _();
    receptions = await fb.receptions();
    _();
  }

  ReceptionModel receptionName(String id) =>
      receptions.firstWhere((element) => element.tel == id);

  void _() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
