
import 'lan/en.dart';
import 'lan/krill.dart';
import 'lan/ru.dart';
import 'lan/uz.dart';

String currLan = "uz";

final lan = Lan.instance;

class Lan {
  Lan._();

  Future<void> init() async {
    print('inittttttt');
    // await db.take().then((value) {
    //   currLan = value;
    // });
  }

  static Lan instance = Lan._();

  String call(String key, [String? l]) {
    if (currLan == 'no' && l == null) return '...';
    if ((l ?? currLan) == 'en') {
      return en[key] ?? key;
    } else if ((l ?? currLan) == 'uz') {
      return uz[key] ?? key;
    } else if ((l ?? currLan) == 'ru') {
      return ru[key] ?? key;
    } else if ((l ?? currLan) == 'krill') {
      return krill[key] ?? key;
    } else {
      return key;
    }
  }

  Future<void> change(String newLan) async {
    currLan = newLan;
    // await db.set();
  }
}
