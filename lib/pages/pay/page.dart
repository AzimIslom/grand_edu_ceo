part of 'imports.dart';

class PayPage extends StatelessWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PayVM>(
      create: (_) => PayVM(),
      child: Scaffold(),
    );
  }
}
